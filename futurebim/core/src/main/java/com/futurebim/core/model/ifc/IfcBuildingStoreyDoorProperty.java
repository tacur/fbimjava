package com.futurebim.core.model.ifc;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.futurebim.core.model.base.SerializableModelBase;

/**
 * The persistent class for the ifc_building_storey_door_properties database table.
 *
 */
@Entity
@Table(name = "ifc_building_storey_door_properties")
public class IfcBuildingStoreyDoorProperty extends SerializableModelBase {

  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private LocalDateTime created;

  private short status = 1;

  @Column(name = "property_id")
  private String propertyId;

  @Column(name = "door_id")
  private String doorId;

  // bi-directional many-to-one association to IfcBuildingStoreyDoor
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "door_id", updatable = false, insertable = false)
  private IfcBuildingStoreyDoor ifcBuildingStoreyDoor;

  public IfcBuildingStoreyDoorProperty() {
  }

  public IfcBuildingStoreyDoorProperty(final String doorId, final String propertyId) {
    this.doorId = doorId;
    this.propertyId = propertyId;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(final Long id) {
    this.id = id;
  }

  public LocalDateTime getCreated() {
    return this.created;
  }

  public void setCreated(final LocalDateTime created) {
    this.created = created;
  }

  public short getStatus() {
    return this.status;
  }

  public void setStatus(final short status) {
    this.status = status;
  }

  public IfcBuildingStoreyDoor getIfcBuildingStoreyDoor() {
    return this.ifcBuildingStoreyDoor;
  }

  public void setIfcBuildingStoreyDoor(final IfcBuildingStoreyDoor ifcBuildingStoreyDoor) {
    this.ifcBuildingStoreyDoor = ifcBuildingStoreyDoor;
  }

  public String getPropertyId() {
    return propertyId;
  }

  public void setPropertyId(final String propertyId) {
    this.propertyId = propertyId;
  }

  public String getDoorId() {
    return doorId;
  }

  public void setDoorId(final String doorId) {
    this.doorId = doorId;
  }

}
