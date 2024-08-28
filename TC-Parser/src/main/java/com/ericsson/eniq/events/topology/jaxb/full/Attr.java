package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElementRefs;
import javax.xml.bind.annotation.XmlMixed;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"content"})
@XmlRootElement(name="attr")
public class Attr
{

  @XmlElementRefs({@javax.xml.bind.annotation.XmlElementRef(name="struct", namespace="http://www.w3.org/namespace/", type=Struct.class), @javax.xml.bind.annotation.XmlElementRef(name="seq", namespace="http://www.w3.org/namespace/", type=Seq.class)})
  @XmlMixed
  protected List<Object> content;

  @XmlAttribute(required=true)
  protected String name;

  @XmlAttribute(required=true)
  @XmlSchemaType(name="anySimpleType")
  protected String nodeIpAddress;

  @XmlAttribute(required=true)
  @XmlSchemaType(name="anySimpleType")
  protected String nodeIpv6Address;

  public List<Object> getContent()
  {
    if (this.content == null) {
      this.content = new ArrayList();
    }
    return this.content;
  }

  public String getName()
  {
    return this.name;
  }

  public void setName(String paramString)
  {
    this.name = paramString;
  }

  public String getNodeIpAddress()
  {
    return this.nodeIpAddress;
  }

  public void setNodeIpAddress(String paramString)
  {
    this.nodeIpAddress = paramString;
  }

  public String getNodeIpv6Address()
  {
    return this.nodeIpv6Address;
  }

  public void setNodeIpv6Address(String paramString)
  {
    this.nodeIpv6Address = paramString;
  }
}