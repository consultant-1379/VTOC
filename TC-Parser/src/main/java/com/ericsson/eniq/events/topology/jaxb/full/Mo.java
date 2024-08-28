package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"attr"})
@XmlRootElement(name="mo")
public class Mo
{

  @XmlElement(required=true)
  protected List<Attr> attr;

  @XmlAttribute(required=true)
  protected String fdn;

  @XmlAttribute
  protected String mimName;

  @XmlAttribute
  protected String mimVersion;

  public List<Attr> getAttr()
  {
    if (this.attr == null) {
      this.attr = new ArrayList();
    }
    return this.attr;
  }

  public String getFdn()
  {
    return this.fdn;
  }

  public void setFdn(String paramString)
  {
    this.fdn = paramString;
  }

  public String getMimName()
  {
    return this.mimName;
  }

  public void setMimName(String paramString)
  {
    this.mimName = paramString;
  }

  public String getMimVersion()
  {
    return this.mimVersion;
  }

  public void setMimVersion(String paramString)
  {
    this.mimVersion = paramString;
  }
}