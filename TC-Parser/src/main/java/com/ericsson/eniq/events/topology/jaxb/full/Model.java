package com.ericsson.eniq.events.topology.jaxb.full;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="", propOrder={"mo"})
@XmlRootElement(name="model")
public class Model
{

  @XmlElement(required=true)
  protected List<Mo> mo;

  public List<Mo> getMo()
  {
    if (this.mo == null) {
      this.mo = new ArrayList();
    }
    return this.mo;
  }
}