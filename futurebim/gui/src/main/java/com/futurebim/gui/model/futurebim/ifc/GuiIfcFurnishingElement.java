package com.futurebim.gui.model.futurebim.ifc;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

public class GuiIfcFurnishingElement {

  @JacksonXmlProperty(localName = "id", isAttribute = true)
  @JsonProperty(value = "guid")
  private String id;

  @JacksonXmlProperty(localName = "Name", isAttribute = true)
  @JsonProperty(value = "name")
  private String name;

  @JacksonXmlProperty(localName = "ObjectType", isAttribute = true)
  @JsonProperty(value = "ObjectType")
  private String objectType;

  @JacksonXmlProperty(localName = "ObjectPlacement", isAttribute = true)
  @JsonProperty(value = "ObjectPlacement")
  private String objectPlacement;

  @JacksonXmlProperty(localName = "Tag", isAttribute = true)
  @JsonProperty(value = "Tag")
  private String tag;

  // @JsonIgnore
  @JacksonXmlProperty(localName = "IfcPropertySet")
  @JacksonXmlElementWrapper(useWrapping = false)
  @JsonProperty(value = "IfcPropertySet")
  private List<GuiIfcPropertySet> propertySetList = new ArrayList<>();

  // @JsonIgnore
  @JacksonXmlProperty(localName = "IfcOpeningElement")
  @JacksonXmlElementWrapper(useWrapping = false)
  @JsonProperty(value = "IfcOpeningElement")
  private List<GuiIfcOpeningElement> openingElementList = new ArrayList<>();

  // @JsonIgnore
  @JacksonXmlProperty(localName = "IfcFurnitureType")
  @JacksonXmlElementWrapper(useWrapping = false)
  @JsonProperty(value = "IfcFurnitureType")
  private List<GuiIfcFurnitureTypeSet> furnitureTypeList = new ArrayList<>();

  @JacksonXmlProperty(localName = "IfcPresentationLayerAssignment")
  @JacksonXmlElementWrapper(useWrapping = false)
  @JsonProperty(value = "IfcPresentationLayerAssignment")
  private List<GuiIfcPresentationLayerAssignmentSet> presentationLayerAssignmentList = new ArrayList<>();

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

  public String getObjectType() {
    return objectType;
  }

  public void setObjectType(final String objectType) {
    this.objectType = objectType;
  }

  public String getObjectPlacement() {
    return objectPlacement;
  }

  public void setObjectPlacement(final String objectPlacement) {
    this.objectPlacement = objectPlacement;
  }

  public String getTag() {
    return tag;
  }

  public void setTag(final String tag) {
    this.tag = tag;
  }

  public List<GuiIfcPropertySet> getPropertySetList() {
    return propertySetList;
  }

  public void setPropertySetList(final List<GuiIfcPropertySet> propertySetList) {
    this.propertySetList = propertySetList;
  }

  public void addPropertySet(final GuiIfcPropertySet propertySet) {
    this.propertySetList.add(propertySet);
  }

  public List<GuiIfcOpeningElement> getOpeningElementList() {
    return openingElementList;
  }

  public void setOpeningElementList(final List<GuiIfcOpeningElement> openingElementList) {
    this.openingElementList = openingElementList;
  }

  public void addOpeningElement(final GuiIfcOpeningElement openingElement) {
    this.openingElementList.add(openingElement);
  }

  public List<GuiIfcFurnitureTypeSet> getFurnitureTypeList() {
    return furnitureTypeList;
  }

  public void setFurnitureTypeList(final List<GuiIfcFurnitureTypeSet> furnitureTypeList) {
    this.furnitureTypeList = furnitureTypeList;
  }

  public void addFurnitureType(final GuiIfcFurnitureTypeSet furnitureType) {
    this.furnitureTypeList.add(furnitureType);
  }

  public List<GuiIfcPresentationLayerAssignmentSet> getPresentationLayerAssignmentList() {
    return presentationLayerAssignmentList;
  }

  public void setPresentationLayerAssignmentList(final List<GuiIfcPresentationLayerAssignmentSet> presentationLayerAssignmentList) {
    this.presentationLayerAssignmentList = presentationLayerAssignmentList;
  }

  public void addPresentationLayerAssignment(final GuiIfcPresentationLayerAssignmentSet presentationLayerAssignment) {
    this.presentationLayerAssignmentList.add(presentationLayerAssignment);
  }

}
