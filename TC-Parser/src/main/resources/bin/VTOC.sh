#!/bin/bash
# ********************************************************************
#                   Ericsson        SCRIPT
# ********************************************************************
#
#
# (c) Ericsson  2017 - All rights reserved.
#
# The copyright to the computer program(s) herein is the property
# of Ericsson Radio Systems AB, Sweden. The programs may be used 
# and/or copied only with the written permission from Ericsson Radio 
# Systems AB or in accordance with the terms and conditions stipulated 
# in the agreement/contract under which the program(s) have been 
# supplied.
#
# ********************************************************************
# Name    : VTOC.sh
# Date    : 23/06/2016
# Purpose : Script that will Automate the LTEES Counter Verification
#
# ********************************************************************
#
#     Command Section
#
# ********************************************************************
AWK=/usr/bin/awk
CAT=/usr/bin/cat
CUT=/usr/bin/cut
SORT=/usr/bin/sort
UNIQ=/usr/bin/uniq
DF=/usr/bin/df
DIRNAME=/usr/bin/dirname
ECHO=/usr/bin/echo
EGREP=/usr/bin/egrep
GREP=/usr/bin/grep
GEGREP=/usr/sfw/bin/gegrep
LSOF=/usr/local/bin/lsof
MKDIR=/usr/bin/mkdir
NAWK=/usr/bin/nawk
PERL=/usr/bin/perl
REMSH=/usr/bin/remsh
SED=/usr/bin/sed
SSH=/usr/bin/ssh
TEE=/usr/bin/tee
TR=/usr/bin/tr
PING=/usr/sbin/ping
PRINTF=/usr/bin/printf
PYTHON=/usr/bin/python
LS=/usr/bin/ls
JAVA=/eniq/sw/runtime/jdk/bin/java
RM=/usr/bin/rm
CP=/usr/bin/cp

#Configurations File
CONFFILE="../config/Config.txt"
NEW_TABLE_CFG="../etc/new_table.cfg"
DATABASE_CFG="../etc/db.cfg"
TIME_START=`date '+%Y-%b-%d_%H.%M.%S'`
LOGFILE=../logs/$TIME_START".log"
GRIT_PATH=../lib/Grit.jar
TOPOLOGY_COUNTER_PARSER=../lib/TC-Parser-v1.0.jar
CLEANUPFILE=makeCTRSTable.sql
TABLES=TablesList.txt
TEMPTABLES=TablesList_New.txt


RULES_PATH_16A="16A"
RULES_PATH_16B="16B"
RULES_PATH_17A="17A"
RULES_PATH_17A_1="17A_1"


function helpmsg()
{
    ${ECHO} ""
    ${ECHO} "Usage: VTOC.sh -a <action name>  -r <Release> -v <Verbose>"
    ${ECHO} "       VTOC.sh -h[help]"
	${ECHO} "action name: startvtoc|cleanup"
    ${ECHO} "  "
    ${ECHO} "  startvtoc      Start VTOC to verify LTEES"
    ${ECHO} "  cleanup        Drop all the previous GRIT tables from Database"
    ${ECHO} "  "
	${ECHO} "Release: 16A|16B|17A|17A_1"
	${ECHO} "  "
	${ECHO} "  "
	${ECHO} "Verbose: Y|N"
	${ECHO} "  "
	${ECHO} "!!! Update Config.txt file before starting the verification"
	${ECHO} "!!! Put Counter.xml file in COUNTER Folder and CTRS file in CTRS Folder"
	${ECHO} "!!! Put Topology xml in TOPOLOGY Folder and the Schema(101 xml) in Schema folder"
	${ECHO} "!!! Results can be seen in text format in results folder or CSV format in CSV folder"
	${ECHO} "  "
}


function cleanup()
{

if [[ ! -r ${CLEANUPFILE} ]];then
        ${ECHO} "\t\tERROR:Cleanup File makeCTRSTable.sql not available  \n" | $TEE -a ${LOGFILE}
        exit 2
fi
    
   $JAVA -jar  ${GRIT_PATH} -a cleanup -f ${CLEANUPFILE} -d ${DATABASE_CFG} 2>> ${LOGFILE}
}

function startvtoc()
{
    TEST_RELEASE=$1
    $PRINTF "\n Input the number for which you want the verification to be run. For more than one option separate numbers by comma.\nE.g 1 - For All \n 2,3 - For Cell and CellRelation"
    $PRINTF "\n1) All\n2) CELL \n3) CELL RELATION\n4) PROCESSOR LOAD\n5) TERM POINT TO MME\n6) TERM POINT TO ENB\n7) ENODEB"
    $PRINTF "\n Choose Options:\n"
    read options 
	if [[ ${options} =~ ^[1-7]([,][1-7])*?$ ]]; then 
	
		echo ${TEST_RELEASE}
		CheckRunningProcess
		CheckInteruption ${TEST_RELEASE}
		ReadProperty ${TEST_RELEASE}
		ConfigureDatabase
		ModifySqlQueries
		loadSchema
		createTable
		runAlterQueries
		parseRawData
		populateTopology
		parseCounterFile
		populateCounterTable
		runUpdateKeyColumns	
		runUpdateCounters
		runMultiEventCounters
		
    echo $options | sed -n 1'p' | tr ',' '\n' | while read word;
    do
 
        case $word in
        1)
			
            MatchRulesForCell
            MatchRulesForCellRelation
            MatchRulesForProcessorLoad
            MatchRulesForForTermPointToMME
            MatchRulesForForTermPointToENB
            MatchRulesForForEnodeB
            ReportGenerationForCell
			ReportGenerationForCellRelation
			ReportGenerationForProcessorLoad
			ReportGenerationForTermPointToMME
			ReportGenerationForTermPointToENB
			ReportGenerationForEnodeB
            ;;
            
            
        2)
			
            MatchRulesForCell
            ReportGenerationForCell
              ;; 
        3)
			
            MatchRulesForCellRelation
            ReportGenerationForCellRelation
              ;; 
        4)
			
            MatchRulesForProcessorLoad
            ReportGenerationForProcessorLoad
              ;; 
        5)	
			
            MatchRulesForForTermPointToMME
            ReportGenerationForTermPointToMME
              ;; 
        6)
			
            MatchRulesForForTermPointToENB
            ReportGenerationForTermPointToENB
              ;; 
        7)
			
            MatchRulesForForEnodeB
            ReportGenerationForEnodeB
              ;; 
              
        *)    
           
			
            break
            ;;
 
        
    esac
done
        MergeAllReport
        CleanupFiles
	else
		 
		 ${ECHO}  "\t\t \n Invalid input. Please select Input between 1-7. For more than one option separate numbers by comma.\nE.g 1 - For All \n 2,3 - For Cell and CellRelation\n" | $TEE -a ${LOGFILE}
		 exit 10
	fi
	


}  



### Function: iniget ###
#
# Read specified parts from a given ini file
#
# Arguments:
#       -f  : specified ini file
#    -p  : gives whole matching <line>
#    -v  : gives only value of matching <line>
#       raw : will print even commented (;) lines
# Return Values:
#       0 : Success
#       1 : Error
#    Text output
iniget() 
{

    if [ -n "$1" ]; then
        INIBLOCK="$1"
        shift 1
    else
        $ECHO "Usage: iniget <block> -f <configfile> [-<p|v> <line>] [raw]"
        return 1
    fi

    unset INIWLINE INILINE INICONFIGFILE INIPRINTTYPE
    while [ -n "$1" ]; do
        case $1 in
        -p)    INIWLINE=parameter
            INILINE=$2
            shift 2
            ;;
        -v)    INIWLINE=value
            INILINE=$2
            shift 2
        ;;
        -f)    INICONFIGFILE=$2
            shift 2
        ;;
        raw)    INIPRINTTYPE=raw
            shift 1
        ;;
        *)    return 1
        ;;
        esac
    done

    if [ -z "$INICONFIGFILE" ]; then
        $ECHO "Usage: iniget <block> -f <configfile> [-<p|v> <line>] [raw]"
        return 1
    fi

    $NAWK -F= -v printtype=$INIPRINTTYPE -v line="$INILINE" -v way=$INIWLINE '
    { sub(/[     ]*$/,"");    #remove trailing whitespace and tabs
        if ($1=="['$INIBLOCK']") {
        while ((getline) > 0) {
            if ($0 ~ /^ *\[/) exit
            if (($0 ~ /^ *;/) && (printtype!="raw")) continue
			        if ($1==line) {
					
                if (way=="parameter") {print $0;  exit}
                if (way=="value")     {sub(/^[^=]*=/,""); print $0; exit}
            }
            else if (! line) print $0
        }
        }
    }' $INICONFIGFILE

}
### Function: iniset ###
#
# Set specified parts from a given ini file
#
# Arguments:
#	-p  : gives whole matching <line>
#	-v  : gives only value of matching <line>
#      -f  : config file name
#       raw : will print even commented (;) lines
# Return Values:
#       0 : Success
#       1 : Error
#	
# iniset <block> [-f <configfile>] [del] <text>
#
iniset() 
{
if [ -n "$1" ]; then
    INIBLOCK="$1"
    shift 1
else
    $ECHO "Usage: iniset <block> [-f <configfile>] [del] <param1=value> [<param2=value2>]"
    return 1
fi

unset INICONFIGFILE ini_del
$RM -f /tmp/.file.$$
while [ -n "$1" ]; do
    case $1 in
	-f)	INICONFIGFILE="$2"
		shift 2
		;;
	del)	ini_del=y
		shift 1
		;;
	*)	echo "$1" >> /tmp/.file.$$ 
		shift 1
		;;
    esac
done
if [ -z "$INICONFIGFILE" ]; then
    $ECHO "Usage: iniset <block> [-f <configfile>] [del] <param1=value> [<param2=value2>]"
    return 1
fi

# Permission-keeping copy
$CP -p $INICONFIGFILE $INICONFIGFILE.$$ || return 1
$ECHO "" > $INICONFIGFILE.$$ || return 1

$NAWK -F= -v del=$ini_del -v textfile=/tmp/.file.$$ '
  BEGIN {
	while((getline < textfile) > 0) {
	foo=$1
	sub(/^[^=]*=/,"")
	line[foo]=$0
	}
  }
  {	sub(/[	 ]*$/,"");	#remove trailing whitespace and tabs
	if (($1=="['$INIBLOCK']") && (edited=="done")) {
		print "ERROR: Multiple instances of ['$INIBLOCK'] found, exiting" > "/dev/stderr"
		exit 1
	}
	if ($1=="['$INIBLOCK']") { found="y"; print $0; next }
	if (! found) { print $0; next }
	if ($0 ~ /^ *\[/) {
		# End of block, flush all remaining entries
		for (entry in line) { print entry "=" line[entry] }
		found=""; edited="done"; print $0; next
	}
	if (! del) {
		for (entry in line) {
			if (entry==$1) { print entry "=" line[entry]; delete line[entry]; next }
		}
		print $0
	}
  }
  END {
	if (found=="y") {
		# End of file, flush all remaining entries
		for (entry in line) { print entry "=" line[entry] }
	}
	else if (edited!="done") {
		# Create new block, flush all entries
		print; print "['$INIBLOCK']"
		for (entry in line) { print entry "=" line[entry] }
	}

  }' $INICONFIGFILE > $INICONFIGFILE.$$
  [ $? = 0 ] && mv $INICONFIGFILE.$$ $INICONFIGFILE || return 1
  rm -f /tmp/.file.$$
}
function CheckRunningProcess
{
  Z=`ps -af | grep "VTOC.sh" | grep -v "grep" | wc -l`
  #Determine if the VTOC.sh already running
  if [[ "$Z" -ne 2 ]] ; then
    echo "Another instance of VTOC.sh is running. Please wait for it to finish first and then try again."
    exit 2
  fi
}
function CheckInteruption()
{

   
	CFG_SECTION=`${CAT} release.txt|head -1`
	echo $CFG_SECTION
    if [[ ! -r $CONFFILE ]];then
        ${ECHO} "\t\tERROR: Configuration File Config.txt is not readable or not available \n" | $TEE -a ${LOGFILE}
        exit 2
    fi
	
	
	   if [[  -r $TEMPTABLES ]];then
        ${ECHO} "\t\t Last run was interuppted . Reverting the changes to previous please wait a while before we begin \n" | $TEE -a ${LOGFILE}
			PREVIOUS_COUNTER_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfCounterTable`
			PREVIOUS_EVENT_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfCTRSTable`
            PREVIOUS_TOPOLOGY_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfTopologyTable`
			CTRS_TABLE=`iniget ${CFG_SECTION} -f $TEMPTABLES -v NameOfCTRSTable`
			COUNTER_TABLE=`iniget ${CFG_SECTION} -f $TEMPTABLES -v NameOfCounterTable`
			TOPOLOGY_TABLE=`iniget ${CFG_SECTION} -f $TEMPTABLES -v NameOfTopologyTable`
			BackupFiles
			
			rm -rf $TEMPTABLES
			
		
		fi
    
	
	
}
function ReadProperty()
{

    local CFG_SECTION="CFG_$1"
	
    if [[ ! -r $CONFFILE ]];then
        ${ECHO} "\t\tERROR: Configuration File Config.txt is not readable or not available \n" | $TEE -a ${LOGFILE}
        exit 2
    fi
    	echo $CFG_SECTION > release.txt

    PREVIOUS_COUNTER_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfCounterTable`
    PREVIOUS_EVENT_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfCTRSTable`
    PREVIOUS_TOPOLOGY_TABLE_NAME=`iniget ${CFG_SECTION} -f $TABLES -v NameOfTopologyTable`
	 
    HOST=`iniget ${CFG_SECTION} -f $CONFFILE -v hostName`
    CTRS_TABLE=`iniget ${CFG_SECTION} -f $CONFFILE -v NameOfCTRSTable` 
    COUNTER_TABLE=`iniget ${CFG_SECTION} -f $CONFFILE -v NameOfCounterTable`
	TOPOLOGY_TABLE=`iniget ${CFG_SECTION} -f $CONFFILE -v NameOfTopologyTable`
    SCHEMA=`iniget ${CFG_SECTION} -f $CONFFILE -v SchemaName`
    CTRS_FILES=`iniget ${CFG_SECTION} -f $CONFFILE -v CtrsFileLocation`
    TOPOLOGY_FILES=`iniget ${CFG_SECTION} -f $CONFFILE -v TopologyLocation`
    COUNTER_FILES=`iniget ${CFG_SECTION} -f $CONFFILE -v CounterFileLocation`
    #GetLineNumber ${CFG_SECTION}
	cp -r $TABLES $TEMPTABLES
	
	#${PERL} -pi -e '~s/'=${PREVIOUS_EVENT_TABLE_NAME}'/'=${CTRS_TABLE}'/g  if $. == '$CTRSLINE''   $TEMPTABLES
	#${PERL} -pi -e '~s/'=${PREVIOUS_COUNTER_TABLE_NAME}'/'=${COUNTER_TABLE}'/g  if $. == '$COUNTERLINE''  $TEMPTABLES
	#${PERL} -pi -e '~s/'=${PREVIOUS_TOPOLOGY_TABLE_NAME}'/'=${TOPOLOGY_TABLE}'/g  if $. == '$TOPOLOGYLINE'' $TEMPTABLES
	iniset "${CFG_SECTION}" -f $TEMPTABLES NameOfCTRSTable="${CTRS_TABLE}"
	iniset "${CFG_SECTION}" -f $TEMPTABLES NameOfCounterTable="${COUNTER_TABLE}"
	iniset "${CFG_SECTION}" -f $TEMPTABLES NameOfTopologyTable="${TOPOLOGY_TABLE}"

	chmod 777 $TEMPTABLES
}

GetLineNumber()
{
SECTION=$1

n=$(sed -n "/$SECTION/=" ../config/Config.txt)
CTRSLINE=$(( n + 2 ));
COUNTERLINE=$(( n + 3 ));
TOPOLOGYLINE=$(( n + 4 ));




}

 function MergeAllReport()
 {
	COMMONDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	OUTDIR=../results/${TEST_RELEASE}/COMMONREPORT
	
	   if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
		fi
	cd $OUTDIR	
	rm -rf COMMONREPORT.csv
	cd -
	ABS_PATH_OUT=`cd "$OUTDIR"; pwd`	
	
	cd $COMMONDIR
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > COMMONREPORT.csv
	chmod 777 COMMONREPORT.csv
	mv COMMONREPORT.csv $ABS_PATH_OUT/COMMONREPORT.csv
	cd -
	rm -rf $COMMONDIR
	
 }
function ReportGenerationForCell()


{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/CELL/CSV	
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	if [ ! -d $OUTDIR ]; then
        mkdir  $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`  
	cd   $DIRECTORY_CSV
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="CELL" FS $1;}1' OFS=, IN.csv > CELL.csv	
	${PERL} -pi -e 's/CELL,Expected/MOID,Expected/g' CELL.csv
	mv CELL.csv $ABS_PATH/CELL.csv
	rm -rf IN.csv
	cd -
		
	
}

function ReportGenerationForCellRelation()
{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/CELL_RELATION/CSV	
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
		if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`
	
	cd $DIRECTORY_CSV			 
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="CELLRELATION" FS $1;}1' OFS=, IN.csv > CELLRELATION.csv
	${PERL} -pi -e 's/CELLRELATION,Expected/MOID,Expected/g' CELLRELATION.csv
	mv CELLRELATION.csv $ABS_PATH/CELLRELATION.csv
	rm -rf IN.csv
	cd -
	
	


}

function ReportGenerationForProcessorLoad()
{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/PROCESSORLOAD/CSV
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`
	
	cd $DIRECTORY_CSV	 
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="PROCESSORLOAD" FS $1;}1' OFS=, IN.csv > PROCESSORLOAD.csv
	
	${PERL} -pi -e '~s/PROCESSORLOAD,Expected/MOID,Expected/g' PROCESSORLOAD.csv

	mv PROCESSORLOAD.csv $ABS_PATH/PROCESSORLOAD.csv
	rm -rf IN.csv
	cd -	
}


function ReportGenerationForTermPointToMME()
{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/TERMPOINTTOMME/CSV
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`
		
	cd $DIRECTORY_CSV	
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="TERMPOINTTOMME" FS $1;}1' OFS=, IN.csv > TERMPOINTTOMME.csv
	${PERL} -pi -e 's/TERMPOINTTOMME,Expected/MOID,Expected/g' TERMPOINTTOMME.csv
	mv TERMPOINTTOMME.csv $ABS_PATH/TERMPOINTTOMME.csv
	rm -rf IN.csv
	cd -
	
	




}

function ReportGenerationForTermPointToENB()
{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/TERMPOINTTOENB/CSV	
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`
	
	cd $DIRECTORY_CSV		 
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="TERMPOINTTOENB" FS $1;}1' OFS=, IN.csv > TERMPOINTTOENB.csv
	${PERL} -pi -e 's/TERMPOINTTOENB,Expected/MOID,Expected/g' TERMPOINTTOENB.csv
	mv TERMPOINTTOENB.csv $ABS_PATH/TERMPOINTTOENB.csv
	rm -rf IN.csv
	cd -	
}

function ReportGenerationForEnodeB()

{
	DIRECTORY_CSV=../results/${TEST_RELEASE}/ENODEB/CSV 
	OUTDIR=../results/${TEST_RELEASE}/CONSOLIDATEDREPORT
	if [ ! -d $OUTDIR ]; then
        mkdir $OUTDIR
    fi
	ABS_PATH=`cd "$OUTDIR"; pwd`




	
	cd $DIRECTORY_CSV			 
	nawk 'FNR==1 && NR!=1{next;}{print}' *.csv > IN.csv
	chmod 777 IN.csv
	nawk -F, '{$1="ENODEB" FS $1;}1' OFS=, IN.csv > ENODEB.csv
	${PERL} -pi -e 's/ENODEB,Expected/MOID,Expected/g' ENODEB.csv
	mv ENODEB.csv $ABS_PATH/ENODEB.csv
	rm -rf IN.csv
	cd -

}
 
function CleanupFiles()
{

rm -rf TablesList.txt
mv TablesList_New.txt TablesList.txt
}

 trap ctrl_c INT

function ctrl_c() {
        echo "CTRL C detected Exiting the script!!!"
		
		exit 2
}


function BackupFiles()
{

	
	echo  "Backing up files......"
	
    ${PERL} -pi -e '~s/'${CTRS_TABLE}_'/'${PREVIOUS_EVENT_TABLE_NAME}_'/g'  ../query/${TEST_RELEASE}/AddColumns/*.sql 
	${PERL} -pi -e '~s/'${CTRS_TABLE}_'/'${PREVIOUS_EVENT_TABLE_NAME}_'/g'  ../query/${TEST_RELEASE}/UpdateCounterValues/*.sql	
	${PERL} -pi -e '~s/'${TOPOLOGY_TABLE}_'/'${PREVIOUS_TOPOLOGY_TABLE_NAME}_'/g'  ../query/${TEST_RELEASE}/UpdateCounterValues/*.sql		
	${PERL} -pi -e '~s/'${CTRS_TABLE}_'/'${PREVIOUS_EVENT_TABLE_NAME}_'/g' ../query/${TEST_RELEASE}/UpdateKeyColumnsValues/*.sql
	${PERL} -pi -e '~s/'${TOPOLOGY_TABLE}_'/'${PREVIOUS_TOPOLOGY_TABLE_NAME}_'/g' ../query/${TEST_RELEASE}/UpdateKeyColumnsValues/*.sql
	${PERL} -pi -e '~s/'${CTRS_TABLE}_'/'${PREVIOUS_EVENT_TABLE_NAME}_'/g' ../query/${TEST_RELEASE}/MultiEventBasedCounter/*.sql
    ${PERL} -pi -e '~s/'${CTRS_TABLE}_'/'${PREVIOUS_EVENT_TABLE_NAME}_'/g' ${NEW_TABLE_CFG} 
    ${PERL} -pi -e '~s/'${COUNTER_TABLE}'/'${PREVIOUS_COUNTER_TABLE_NAME}'/g' ${NEW_TABLE_CFG} 
	
     chmod -R 777 ../query
echo "Finished Successfully!!!"

}
function ConfigureDatabase()
{
   
    ${ECHO}  "\t\tModifying db.cfg and new_table.cfg  started\n" | $TEE -a ${LOGFILE}
    
    
	INPUT_HOUR_ID=`iniget INPUT_COMMON_CONFIG -f ${CONFFILE} -v hour`
	INPUT_MINUTE_ID=`iniget INPUT_COMMON_CONFIG -f ${CONFFILE} -v min`
	OUTPUT_DATE_ID=`iniget OUTPUT_COMMON_CONFIG -f ${CONFFILE} -v date`
	OUTPUT_HOUR_ID=`iniget OUTPUT_COMMON_CONFIG -f ${CONFFILE} -v hour`
	OUTPUT_MINUTE_ID=`iniget OUTPUT_COMMON_CONFIG -f ${CONFFILE} -v min`
	
	#${PERL} -pi -e '~s/'${PREVIOUS_EVENT_TABLE_NAME}_'/'${CTRS_TABLE}_'/g' ../etc/${TEST_RELEASE}/${NEW_TABLE_CFG} 
	#${PERL} -pi -e '~s/'${PREVIOUS_COUNTER_TABLE_NAME}'/'${COUNTER_TABLE}'/g' ../etc/${TEST_RELEASE}/${NEW_TABLE_CFG} 
 	${PERL} -pi -e '~s/hostName =.*/hostName = '${HOST}'/g' ${DATABASE_CFG}
	rm -rf ${NEW_TABLE_CFG}
	echo "# set the section describing the in table and the section describing the out table to match it" |tee -a ${NEW_TABLE_CFG}
	echo "[run_comparisons]" |tee -a ${NEW_TABLE_CFG}
	$ECHO "${CTRS_TABLE}_TESTID"="${COUNTER_TABLE}" |tee -a ${NEW_TABLE_CFG}
	$ECHO "" |tee -a ${NEW_TABLE_CFG}
    $ECHO "[${CTRS_TABLE}_TESTID]" |tee -a ${NEW_TABLE_CFG}	
	$ECHO "hour"="${INPUT_HOUR_ID}" |tee -a ${NEW_TABLE_CFG}
	$ECHO  "min"="${INPUT_MINUTE_ID}" |tee -a ${NEW_TABLE_CFG}	
	$ECHO "" |tee -a ${NEW_TABLE_CFG}
	$ECHO "[${COUNTER_TABLE}]" |tee -a ${NEW_TABLE_CFG}	
	$ECHO "date"="${OUTPUT_DATE_ID}" |tee -a ${NEW_TABLE_CFG}
	$ECHO "hour"="${OUTPUT_HOUR_ID}" |tee -a ${NEW_TABLE_CFG}
	$ECHO "min"="${OUTPUT_MINUTE_ID}"  |tee -a ${NEW_TABLE_CFG}
    #iniset run_comparisons -f ${NEW_TABLE_CFG} "${CTRS_TABLE}_TESTID"="${COUNTER_TABLE}"
	#echo "" |tee -a ${NEW_TABLE_CFG}
	#iniset run_comparisons -f ${NEW_TABLE_CFG} ""
	#iniset "${CTRS_TABLE}_TESTID" -f ${NEW_TABLE_CFG} "min"="${INPUT_MINUTE_ID}" "hour"="${INPUT_HOUR_ID}"
	#echo "" |tee -a ${NEW_TABLE_CFG}
	#iniset "${COUNTER_TABLE}" -f ${NEW_TABLE_CFG} "min"="${OUTPUT_MINUTE_ID}" "hour"="${OUTPUT_HOUR_ID}" "date"="${OUTPUT_DATE_ID}"
	#echo "" |tee -a ${NEW_TABLE_CFG}
	#iniset "${COUNTER_TABLE}" -f ${NEW_TABLE_CFG} "hour"="${OUTPUT_HOUR_ID}"
	#iniset "${COUNTER_TABLE}" -f ${NEW_TABLE_CFG} "min"="${OUTPUT_MINUTE_ID}"

    chmod -R 777 ../etc
     
    ${ECHO} "\t\tdb.cfg and new_table.cfg modified successfully!!!\n" | ${TEE} -a ${LOGFILE}

 }
 
 function ModifySqlQueries()
{
   
    ${ECHO}  "\t\tModifying Sql Queries\n" | $TEE -a ${LOGFILE}
    
	
	
    ${PERL} -pi -e '~s/'${PREVIOUS_EVENT_TABLE_NAME}_'/'${CTRS_TABLE}_'/g'  ../query/${TEST_RELEASE}/AddColumns/*.sql 
	${PERL} -pi -e '~s/'${PREVIOUS_EVENT_TABLE_NAME}_'/'${CTRS_TABLE}_'/g'  ../query/${TEST_RELEASE}/UpdateCounterValues/*.sql	
	${PERL} -pi -e '~s/'${PREVIOUS_TOPOLOGY_TABLE_NAME}_'/'${TOPOLOGY_TABLE}_'/g'  ../query/${TEST_RELEASE}/UpdateCounterValues/*.sql		
	${PERL} -pi -e '~s/'${PREVIOUS_EVENT_TABLE_NAME}_'/'${CTRS_TABLE}_'/g' ../query/${TEST_RELEASE}/UpdateKeyColumnsValues/*.sql
	${PERL} -pi -e '~s/'${PREVIOUS_TOPOLOGY_TABLE_NAME}_'/'${TOPOLOGY_TABLE}_'/g' ../query/${TEST_RELEASE}/UpdateKeyColumnsValues/*.sql
	${PERL} -pi -e '~s/'${PREVIOUS_EVENT_TABLE_NAME}_'/'${CTRS_TABLE}_'/g' ../query/${TEST_RELEASE}/MultiEventBasedCounter/*.sql
  
     chmod -R 777 ../query
	 
    ${ECHO} "\t\tQueries modified successfully!!!\n" | ${TEE} -a ${LOGFILE}

 }
 
function loadSchema()
{
     
    ${ECHO}  "\t\tSchema $SCHEMA Loading Started!!!\n" | ${TEE} -a ${LOGFILE}
    ${JAVA} -jar  ${GRIT_PATH} -a 10dash -t ${SCHEMA} -s CTRS -f CTRS -p ${CTRS_TABLE} 2>> ${LOGFILE}
    ${ECHO}  "\t\tSchema $SCHEMA Loading Finished!!!\n" | ${TEE} -a ${LOGFILE}
}

function createTable()
{
   
    ${ECHO} "\t\tCreating Event Tables...\n" | ${TEE} -a ${LOGFILE}    
	${JAVA} -jar ../lib/Database.jar ./ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START}  2>> ${LOGFILE}
    #${JAVA} -DconnectionProperties=${DATABASE_CFG} -jar ../lib/Db-controller-v-1.0.jar -s ./ -p -123 -qt CREATE  
	${ECHO}  "\t\tTable Creation Finished\n" | ${TEE} -a ${LOGFILE}
    
}
 
 function parseRawData()
{
    
    DIRECTORY="Sql"
    ${ECHO}   "\t\tParsing Raw Data Started!!!\n" | ${TEE} -a ${LOGFILE}
    cd ${CTRS_FILES}
    if [ ! -d $DIRECTORY ]; then
        mkdir $DIRECTORY
    fi
  
    cd -
  
    for line in ${CTRS_FILES}/*.gz;
        do
            ${JAVA} -jar ${GRIT_PATH} -a raw -s CTRS -i $line -d ${DATABASE_CFG} -o ${CTRS_FILES}/${DIRECTORY}/InputCTRS1.sql 2>> ${LOGFILE}
          sed '1,3d' ${CTRS_FILES}/${DIRECTORY}/InputCTRS1.sql > tmpfile; mv tmpfile ${CTRS_FILES}/${DIRECTORY}/InputCTRS1.sql
			
			${JAVA} -jar ../lib/Database.jar ${CTRS_FILES}/${DIRECTORY}/ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
            #${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ./ -p -123 -qt INSERT -DconnectionProperties=${DATABASE_CFG}
		
        done
    
    
    
    ${ECHO}   "\t\tParsing Raw Data Finished!!!\n" | ${TEE} -a ${LOGFILE}
    
 }
 

 
 
function populateTopology()
{ 
  DIRECTORY="unzipped"    
    if [  -d $DIRECTORY ]; then
        rm -rf $DIRECTORY
    fi
   
    ${ECHO}  "\t\tPopulating Topology Table...\n" | ${TEE} -a ${LOGFILE}
    DIR=${TOPOLOGY_FILES}"/Sql"
    ${JAVA} -jar ${TOPOLOGY_COUNTER_PARSER} -s ${TOPOLOGY_FILES} -p topology -o ${DIR} 2>> ${LOGFILE}
    TOPOLOGYNAME="TOPO"
     ${PERL} -pi -e '~s/'${TOPOLOGYNAME}'/'${TOPOLOGY_TABLE}'/g'  $DIR/create/*.sql
	 ${PERL} -pi -e '~s/'${TOPOLOGYNAME}'/'${TOPOLOGY_TABLE}'/g'  ${TOPOLOGY_FILES}/Sql/insert/*.sql;
      
   
    ${JAVA} -jar ../lib/Database.jar $DIR/create/ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
	#${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s $DIR/create/ -p -123 -qt CREATE -DconnectionProperties=${DATABASE_CFG}
    ${JAVA} -jar ../lib/Database.jar ${TOPOLOGY_FILES}/Sql/insert/ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE} 
   #${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ${TOPOLOGY_FILES}/Sql/insert/ -p -123 -qt INSERT -DconnectionProperties=${DATABASE_CFG}
     
   
    ${ECHO}  "\t\tTopology Table Populated Successfully!!!\n" | ${TEE} -a ${LOGFILE} 
}

function runAlterQueries()
 {
	${ECHO} "\t\Alter Event Tables started...\n" | ${TEE} -a ${LOGFILE}
	                       
	${JAVA} -jar ../lib/Database.jar ../query/${TEST_RELEASE}/AddColumns ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
	#${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ../query/${TEST_RELEASE}/AddColumns -p -123 -qt ALTER -DconnectionProperties=${DATABASE_CFG}
	${ECHO} "\t\Alter Event Tables completed successfully...\n" | ${TEE} -a ${LOGFILE}
 }


function runUpdateKeyColumns()
 {	
	${ECHO} "\t\Update key columns started...\n" | ${TEE} -a ${LOGFILE}
	 ${JAVA} -jar ../lib/Database.jar ../query/${TEST_RELEASE}/UpdateKeyColumnsValues ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
	#${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ../query/${TEST_RELEASE}/UpdateKeyColumnsValues -p -124 -qt UPDATE -DconnectionProperties=${DATABASE_CFG}
	${ECHO} "\t\Update key columns completed successfully...\n" | ${TEE} -a ${LOGFILE}
 }
 function runUpdateCounters()
 {	
   ${ECHO} "\t\Update Event Tables started...\n" | ${TEE} -a ${LOGFILE}
   
  ${JAVA} -jar ../lib/Database.jar ../query/${TEST_RELEASE}/UpdateCounterValues ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}	
  #${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ../query/${TEST_RELEASE}/UpdateCounterValues -p -124 -qt UPDATE -DconnectionProperties=${DATABASE_CFG}
  
	${ECHO} "\t\Update Event Tables completed successfully...\n" | ${TEE} -a ${LOGFILE}
 }


 function runMultiEventCounters()
 {	
   ${ECHO} "\t\Update Multi Event Tables started...\n" | ${TEE} -a ${LOGFILE}

   
   ${JAVA} -jar ../lib/Database.jar ../query/${TEST_RELEASE}/MultiEventBasedCounter ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
  #${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ../query/${TEST_RELEASE}/MultiEventBasedCounter -p -124 -qt UPDATE -DconnectionProperties=${DATABASE_CFG}
  
	${ECHO} "\t\Update Multi Event Tables completed successfully...\n" | ${TEE} -a ${LOGFILE}
 }

 
function parseCounterFile()
{ 
 
    DIRECTORY=../bin/unzipped
    if [  -d $DIRECTORY ]; then
	echo "YES"
        rm -rf $DIRECTORY
    fi
    COUNTER_SQLS=${COUNTER_FILES}"/Sql"
    ${JAVA} -jar ${TOPOLOGY_COUNTER_PARSER} -s ${COUNTER_FILES} -p counter -o ${COUNTER_SQLS} 2>> ${LOGFILE}
    ${ECHO}  "\t\tCounter Table Parsing Completed!!!\n" | ${TEE} -a ${LOGFILE}
}
 
function populateCounterTable()
{      

    ${PERL} -pi -e '~s/COUNTER_TABLE/'${COUNTER_TABLE}'/g' ${COUNTER_FILES}/Sql/create/*.sql
    ${PERL} -pi -e '~s/COUNTER_TABLE/'${COUNTER_TABLE}'/g' ${COUNTER_FILES}/Sql/insert/*.sql
      
    chmod 777 ${COUNTER_FILES}/Sql/create/*.sql
    chmod 777 ${COUNTER_FILES}/Sql/insert/*.sql
     
     ${JAVA} -jar  ../lib/Database.jar ${COUNTER_FILES}/Sql/create/ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}
	${JAVA} -jar  ../lib/Database.jar ${COUNTER_FILES}/Sql/insert/ ${DATABASE_CFG} ${SET_VERBOSE} ${TIME_START} 2>> ${LOGFILE}          
    # ${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ${COUNTER_FILES}/Sql/create/ -p -123 -qt CREATE -DconnectionProperties=${DATABASE_CFG} 
	# ${JAVA} -jar ../lib/Db-controller-v-1.0.jar -s ${COUNTER_FILES}/Sql/insert/ -p -123 -qt INSERT -DconnectionProperties=${DATABASE_CFG} 
	 
     ${ECHO}  "\t\tCounter Table" $COUNTER_TABLE" Populated Successfully!!!\n" | ${TEE} -a ${LOGFILE}
 }
 
function MatchRulesForCell()
 { 
    ${ECHO}  "\t\tRules Matching Started!!!\n" | ${TEE} -a ${LOGFILE}    
    DIRECTORY_TEXT=../results/${TEST_RELEASE}/CELL/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/CELL/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi
     for cellrules in ../rules/${TEST_RELEASE}/CELL/*.rules;   
        do
        eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"
		extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
	
        ${ECHO}  "\t\tEVENT ID" $eventid" !!!\n" | ${TEE} -a ${LOGFILE}
	 	     
	   ${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}   
	   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/CELL/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/CELL/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/CELL/TEXT/$eventid.txt                      
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                      
        done     

${ECHO}  "\t\tRules Matching done For CELL!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}



function MatchRulesForCellRelation()
 {     
    DIRECTORY_TEXT=../results/${TEST_RELEASE}/CELL_RELATION/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/CELL_RELATION/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi	
     for cellrules in ../rules/${TEST_RELEASE}/CELL_RELATION/*.rules;   
          do 
	eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	
           extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"
        ${ECHO}  "\t\tEVENT ID" $eventid" !!!\n" | ${TEE} -a ${LOGFILE} 
		

   
   ${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}
   
   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/CELL_RELATION/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/CELL_RELATION/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/CELL_RELATION/TEXT/$eventid.txt 
                      
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                                   
        done  
     

${ECHO}  "\t\tRules Matching done for CELL_RELATION!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}
 
 function MatchRulesForProcessorLoad()
 { 
	DIRECTORY_TEXT=../results/${TEST_RELEASE}/PROCESSORLOAD/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/PROCESSORLOAD/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi	
    
     for cellrules in ../rules/${TEST_RELEASE}/PROCESSORLOAD/*.rules;   
        do
        eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	
		extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"
		
		${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}
   
   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/PROCESSORLOAD/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/PROCESSORLOAD/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/PROCESSORLOAD/TEXT/$eventid.txt 
                      
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                                 
        done 

${ECHO}  "\t\tRules Matching done for PROCESSORLOAD!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}

function MatchRulesForForTermPointToMME()
 { 
	DIRECTORY_TEXT=../results/${TEST_RELEASE}/TERMPOINTTOMME/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/TERMPOINTTOMME/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi	
    eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	#PREVIOUS_EVENT_NAME="$(${ECHO} $eventName| cut -d'_' -f2)"  
		extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
     for cellrules in ../rules/${TEST_RELEASE}/TERMPOINTTOMME/*.rules;   
        do
            
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"
		  
  ${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}
   
   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/TERMPOINTTOMME/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/TERMPOINTTOMME/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/TERMPOINTTOMME/TEXT/$eventid.txt 
                      
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                                  

            
        done 
     
    
  



${ECHO}  "\t\tRules Matching done for TERMPOINTTOMME!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}

function MatchRulesForForTermPointToENB()
 { 
	DIRECTORY_TEXT=../results/${TEST_RELEASE}/TERMPOINTTOENB/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/TERMPOINTTOENB/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi	
     for cellrules in ../rules/${TEST_RELEASE}/TERMPOINTTOENB/*.rules;   
        do
      eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	
		extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"
    
   ${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}
   
   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/TERMPOINTTOENB/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/TERMPOINTTOENB/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/TERMPOINTTOENB/TEXT/$eventid.txt 
                        
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                                

            
        done 
     
    
  



${ECHO}  "\t\tRules Matching done Successfully For TERMPOINTTOENB!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}

function MatchRulesForForEnodeB()
 { 
    
    
    DIRECTORY_TEXT=../results/${TEST_RELEASE}/ENODEB/TEXT
	DIRECTORY_CSV=../results/${TEST_RELEASE}/ENODEB/CSV   
    if [ ! -d $DIRECTORY_TEXT ]; then
        mkdir -p $DIRECTORY_TEXT
	fi
	if [ ! -d $DIRECTORY_CSV ]; then
        mkdir -p $DIRECTORY_CSV
    fi	
     for cellrules in ../rules/${TEST_RELEASE}/ENODEB/*.rules;   
        do
      eventData=`sed -n '3p' ${NEW_TABLE_CFG}`
    	eventName="$(${ECHO} $eventData| cut -d'=' -f1)"
    	
		extracteventid="$(${ECHO} $eventName | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}' | cut -d'_' -f1 | awk '{ for(i=length;i!=0;i--)x=x substr($0,i,1);}END{print x}')"
        eventid="$(${ECHO} $cellrules  | $AWK -F"/"  '{ print  $NF }' | cut -d'.' -f1 )"        
   ${PERL} -pi -e '~s/'$extracteventid'/'$eventid'/g' ${NEW_TABLE_CFG}   
   ${JAVA} -jar ${GRIT_PATH} -a rules -r ../rules/${TEST_RELEASE}/ENODEB/$eventid.rules -d ${DATABASE_CFG} -t ${NEW_TABLE_CFG}  -v -N -e -csv ../results/${TEST_RELEASE}/ENODEB/CSV/$eventid.csv 2>> ${LOGFILE}  > ../results/${TEST_RELEASE}/ENODEB/TEXT/$eventid.txt 
                      
                        if [[ $?  == 1 ]]
                            then
                                ${ECHO}  "\t\t Rule Failed for "$eventid "\n" | $TEE -a ${LOGFILE}
                            else
                                ${ECHO}  "\t\t Rule run successfully for "$eventid "\n" | $TEE -a ${LOGFILE}
                        fi
                                
        done 
${ECHO}  "\t\tRules Matching done Successfully for ENODEB!!! You can Check Event Wise Results in results folder\n" | ${TEE} -a ${LOGFILE}

}

function identify_action(){
    local COMMAND=$1
    case "$COMMAND" in 
        cleanup)
           ACTION="cleanup"
        ;;
        startvtoc)
            ACTION="startvtoc"
        ;;
        *)
            ${ECHO} "Not recognized Action $1"
            helpmsg
            exit 0
        ;;
    esac
}

#check the release
function identify_release(){
    local PARAM_RELEASE=$1
    case $PARAM_RELEASE in
        "16A")
            RELEASE=${RULES_PATH_16A}
        ;;
        "16B")
            RELEASE=${RULES_PATH_16B}
        ;;
        "17A")
            RELEASE=${RULES_PATH_17A}
        ;;
		"17A_1")
            RELEASE=${RULES_PATH_17A_1}
        ;;
        *)
            ${ECHO} "Unrecognised Release: ../rules/${TEST_RELEASE}"
            helpmsg
            exit 10
            ;;
    esac
}

function identify_verbose(){
    local COMMAND=$1
	echo $COMMAND
    case "$COMMAND" in 
        N)
           SET_VERBOSE="N"
        ;;
        Y)
            SET_VERBOSE="Y"
        ;;
        *)
            ${ECHO} "Not recognized Action $1"
            helpmsg
            exit 0
        ;;
    esac
}
##############main body #################

#no option available
if [[ $# -eq 0 ]];then
    helpmsg
    exit 0
fi

#read command parameter
while getopts "h:a:r:v:" opt
do
    case $opt in        

        a)
            if [[ "$OPTARG" == "" ]];then
                ${ECHO} "No Action Command specified"
                helpmsg
                exit 10
            fi
            PARAM_ACTION=$OPTARG
            ;;
        r)
            if [[ "$OPTARG" == "" ]];then
                ${ECHO} "Release not specified"
                helpmsg
                exit 10
            fi
            PARAM_RELEASE=$OPTARG
            ;;
		v)
            if [[ "$OPTARG" == "" ]];then
                ${ECHO} "Verbose not specified"
                helpmsg
                exit 10
            fi
            PARAM_VERBOSE=$OPTARG
            ;;
	 
        h)
            helpmsg
            exit 0
            ;;
        *)
            ${ECHO} "Unrecognised option"
            helpmsg
            exit 10
            ;;
    esac
done

#check the command
if [[ "$PARAM_ACTION" != "" ]]; then
    identify_action $PARAM_ACTION
else
    helpmsg
    exit 10   
fi

if [[ "$PARAM_RELEASE" != "" ]]; then
    identify_release $PARAM_RELEASE
else
    helpmsg
    exit 10 
fi

if [[ "$PARAM_VERBOSE" != "" ]]; then
    identify_verbose $PARAM_VERBOSE
else
    helpmsg
    exit 10 
fi



 $ACTION $RELEASE

$ECHO "Check logging file ${LOG_FILE} for detailed information"
