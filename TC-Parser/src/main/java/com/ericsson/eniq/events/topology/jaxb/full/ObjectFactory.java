package com.ericsson.eniq.events.topology.jaxb.full;

import javax.xml.bind.annotation.XmlRegistry;

@XmlRegistry
public class ObjectFactory
{
  public Attr createAttr()
  {
    return new Attr();
  }

  public Item createItem()
  {
    return new Item();
  }

  public Model createModel()
  {
    return new Model();
  }

  public Struct createStruct()
  {
    return new Struct();
  }

  public Seq createSeq()
  {
    return new Seq();
  }

  public Mo createMo()
  {
    return new Mo();
  }
}