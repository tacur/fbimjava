package com.futurebim.core.model.ifc.render;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.futurebim.core.model.ifc.IfcDoorstyle;

/**
 * The persistent class for the ifc_doorstyle database table.
 *
 */
public class IfcDoorstyleRender {

  @JacksonXmlProperty(localName = "id", isAttribute = true)
  private String id;

  @JacksonXmlProperty(localName = "Name", isAttribute = true)
  private String typeName;

  @JacksonXmlProperty(localName = "Tag", isAttribute = true)
  private String tag;

  @JacksonXmlProperty(localName = "ConstructionType", isAttribute = true)
  private String constructionType;

  @JacksonXmlProperty(localName = "OperationType", isAttribute = true)
  private String operationType;

  @JacksonXmlProperty(localName = "ParameterTakesPrecedence", isAttribute = true)
  private String parameterTakesPrecedence;

  @JacksonXmlProperty(localName = "Sizeable", isAttribute = true)
  private String sizeable;

  public IfcDoorstyle toModel(final Long modelId) {

    final IfcDoorstyle type = new IfcDoorstyle();

    type.setId(id);
    type.setIfcId(modelId);
    type.setTypeName(typeName);
    type.setTag(tag);
    type.setConstructionType(constructionType);
    type.setOperationType(operationType);
    type.setParameterTakesPrecedence(parameterTakesPrecedence);
    type.setSizeable(sizeable);

    return type;
  }

}
