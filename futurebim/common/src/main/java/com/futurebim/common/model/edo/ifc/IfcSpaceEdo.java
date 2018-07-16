package com.futurebim.common.model.edo.ifc;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

public class IfcSpaceEdo {

  @JacksonXmlProperty(localName = "id", isAttribute = true)
  private String id;

  @JacksonXmlProperty(localName = "Name", isAttribute = true)
  private String name;

  @JacksonXmlProperty(localName = "Description", isAttribute = true)
  private String description;

  @JacksonXmlProperty(localName = "ObjectPlacement", isAttribute = true)
  private String objectPlacement;

  @JacksonXmlProperty(localName = "LongName", isAttribute = true)
  private String longName;

  @JacksonXmlProperty(localName = "CompositionType", isAttribute = true)
  private String compositionType;

  @JacksonXmlProperty(localName = "InteriorOrExteriorSpace", isAttribute = true)
  private String interiorOrExteriorSpace;

  @JacksonXmlProperty(localName = "IfcFurnishingElement")
  @JacksonXmlElementWrapper(useWrapping = false)
  private List<IfcFurnishingElementEdo> furnishingElementList = new ArrayList<>();

  @JacksonXmlProperty(localName = "IfcPropertySet")
  @JacksonXmlElementWrapper(useWrapping = false)
  private List<IfcPropertySetEdo> propertySetList = new ArrayList<>();

  @JacksonXmlProperty(localName = "IfcPresentationLayerAssignment")
  @JacksonXmlElementWrapper(useWrapping = false)
  private List<IfcPresentationLayerAssignmentSetEdo> presentationLayerAssignmentList = new ArrayList<>();

  public String getId() {
    return id;
  }

  public void setId(final String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(final String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(final String description) {
    this.description = description;
  }

  public String getObjectPlacement() {
    return objectPlacement;
  }

  public void setObjectPlacement(final String objectPlacement) {
    this.objectPlacement = objectPlacement;
  }

  public String getLongName() {
    return longName;
  }

  public void setLongName(final String longName) {
    this.longName = longName;
  }

  public String getCompositionType() {
    return compositionType;
  }

  public void setCompositionType(final String compositionType) {
    this.compositionType = compositionType;
  }

  public String getInteriorOrExteriorSpace() {
    return interiorOrExteriorSpace;
  }

  public void setInteriorOrExteriorSpace(final String interiorOrExteriorSpace) {
    this.interiorOrExteriorSpace = interiorOrExteriorSpace;
  }

  public List<IfcFurnishingElementEdo> getFurnishingElementList() {
    return furnishingElementList;
  }

  public void setFurnishingElementList(final List<IfcFurnishingElementEdo> furnishingElementList) {
    this.furnishingElementList = furnishingElementList;
  }

  public void addFurnishingElement(final IfcFurnishingElementEdo furnishingElement) {
    this.furnishingElementList.add(furnishingElement);
  }

  public List<IfcPropertySetEdo> getPropertySetList() {
    return propertySetList;
  }

  public void setPropertySetList(final List<IfcPropertySetEdo> propertySetList) {
    this.propertySetList = propertySetList;
  }

  public void addPropertySet(final IfcPropertySetEdo propertySet) {
    this.propertySetList.add(propertySet);
  }

  public List<IfcPresentationLayerAssignmentSetEdo> getPresentationLayerAssignmentList() {
    return presentationLayerAssignmentList;
  }

  public void setPresentationLayerAssignmentList(final List<IfcPresentationLayerAssignmentSetEdo> presentationLayerAssignmentList) {
    this.presentationLayerAssignmentList = presentationLayerAssignmentList;
  }

  public void addPresentationLayerAssignment(final IfcPresentationLayerAssignmentSetEdo presentationLayerAssignment) {
    this.presentationLayerAssignmentList.add(presentationLayerAssignment);
  }

}
