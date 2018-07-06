package com.futurebim.core.model.ifc.render;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.futurebim.core.model.ifc.IfcProperty;
import com.futurebim.core.model.ifc.ProjectIfc;

/**
 * The persistent class for the ifc_properties database table.
 *
 */

public class IfcPropertyRender {

  @JacksonXmlProperty(localName = "id", isAttribute = true)
  private String id;

  @JacksonXmlProperty(localName = "Name", isAttribute = true)
  private String propertyName;

  @JacksonXmlElementWrapper(useWrapping = false)
  @JacksonXmlProperty(localName = "IfcPropertySingleValue")
  private final List<IfcPropertyValueRender> values = new ArrayList<>();

  public IfcProperty toModel(final ProjectIfc model) {

    final IfcProperty prop = new IfcProperty();
    prop.setIfcId(model.getId());
    prop.setPropertyName(propertyName);
    prop.setId(id);

    for (final IfcPropertyValueRender val : values) {
      prop.addIfcPropertiesValues(val.toModel(id));
    }
    return prop;
  }
}
