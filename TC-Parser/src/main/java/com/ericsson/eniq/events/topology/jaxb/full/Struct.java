package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"attr"})
@XmlRootElement(name="struct")
public class Struct
{
  protected List<Attr> attr;

  public List<Attr> getAttr()
  {
    if (this.attr == null) {
      this.attr = new ArrayList();
    }
    return this.attr;
  }
}