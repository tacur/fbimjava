package com.futurebim.core.model.ifc;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.futurebim.core.model.base.SerializableModelBase;

/**
 * The persistent class for the ifc_building_storey_roof_properties database table.
 *
 */
@Entity
@Table(name = "ifc_building_storey_roof_properties")
public class IfcBuildingStoreyRoofProperty extends SerializableModelBase {

  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  private LocalDateTime created;

  @Column(name = "property_id")
  private String propertyId;

  @Column(name = "roof_id")
  private String roofId;

  private short status;

  // bi-directional many-to-one association to IfcBuildingStoreyRoof
  @ManyToOne
  @JoinColumn(name = "roof_id", updatable = false, insertable = false)
  private IfcBuildingStoreyRoof ifcBuildingStoreyRoof;

  public IfcBuildingStoreyRoofProperty() {
  }

  public IfcBuildingStoreyRoofProperty(final String roofId, final String propertyId) {
    this.roofId = roofId;
    this.propertyId = propertyId;
  }

  public int getId() {
    return this.id;
  }

  public void setId(final int id) {
    this.id = id;
  }

  public LocalDateTime getCreated() {
    return this.created;
  }

  public void setCreated(final LocalDateTime created) {
    this.created = created;
  }

  public String getPropertyId() {
    return this.propertyId;
  }

  public void setPropertyId(final String propertyId) {
    this.propertyId = propertyId;
  }

  public short getStatus() {
    return this.status;
  }

  public void setStatus(final short status) {
    this.status = status;
  }

  public IfcBuildingStoreyRoof getIfcBuildingStoreyRoof() {
    return this.ifcBuildingStoreyRoof;
  }

  public void setIfcBuildingStoreyRoof(final IfcBuildingStoreyRoof ifcBuildingStoreyRoof) {
    this.ifcBuildingStoreyRoof = ifcBuildingStoreyRoof;
  }

  public String getRoofId() {
    return roofId;
  }

  public void setRoofId(final String roofId) {
    this.roofId = roofId;
  }

}
