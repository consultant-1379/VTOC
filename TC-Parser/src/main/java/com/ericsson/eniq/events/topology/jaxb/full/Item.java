package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlMixed;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"content"})
@XmlRootElement(name="item")
public class Item
{

  @XmlElementRef(name="struct", namespace="http://www.w3.org/namespace/", type=Struct.class)
  @XmlMixed
  protected List<Object> content;

  public List<Object> getContent()
  {
    if (this.content == null) {
      this.content = new ArrayList();
    }
    return this.content;
  }
}