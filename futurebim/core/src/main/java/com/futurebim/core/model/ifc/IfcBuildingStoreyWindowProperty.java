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
 * The persistent class for the ifc_building_storey_window_properties database table.
 *
 */
@Entity
@Table(name = "ifc_building_storey_window_properties")
public class IfcBuildingStoreyWindowProperty extends SerializableModelBase {

  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private LocalDateTime created;

  private short status = 1;

  @Column(name = "property_id")
  private String propertyId;

  @Column(name = "window_id")
  private String windowId;

  // bi-directional many-to-one association to IfcBuildingStoreyWindow
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "window_id", updatable = false, insertable = false)
  private IfcBuildingStoreyWindow ifcBuildingStoreyWindow;

  public IfcBuildingStoreyWindowProperty() {
  }

  public IfcBuildingStoreyWindowProperty(final String windowId, final String propertyId) {
    this.windowId = windowId;
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

  public IfcBuildingStoreyWindow getIfcBuildingStoreyWindow() {
    return this.ifcBuildingStoreyWindow;
  }

  public void setIfcBuildingStoreyWindow(final IfcBuildingStoreyWindow ifcBuildingStoreyWindow) {
    this.ifcBuildingStoreyWindow = ifcBuildingStoreyWindow;
  }

  public String getPropertyId() {
    return propertyId;
  }

  public void setPropertyId(final String propertyId) {
    this.propertyId = propertyId;
  }

  public String getWindowId() {
    return windowId;
  }

  public void setWindowId(final String windowId) {
    this.windowId = windowId;
  }

}
