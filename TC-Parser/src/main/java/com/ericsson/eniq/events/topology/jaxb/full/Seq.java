package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"item"})
@XmlRootElement(name="seq")
public class Seq
{

  @XmlElement(required=true)
  protected List<Item> item;

  public List<Item> getItem()
  {
    if (this.item == null) {
      this.item = new ArrayList();
    }
    return this.item;
  }
}