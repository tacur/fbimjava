package com.futurebim.core.model.ifc;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.futurebim.core.model.base.SerializableModelBase;

/**
 * The persistent class for the ifc_building_storey_stair_railing database table.
 *
 */
@Entity
@Table(name = "ifc_building_storey_stair_railing")
public class IfcBuildingStoreyStairRailing extends SerializableModelBase {

  private static final long serialVersionUID = 1L;

  @Id
  private String id;

  private Timestamp created;

  @Column(name = "object_placement")
  private String objectPlacement;

  @Column(name = "object_type")
  private String objectType;

  @Column(name = "railing_name")
  private String railingName;

  private short status;

  private String tag;

  private Timestamp updated;

  private int version = 1;

  // bi-directional many-to-one association to IfcBuildingStorey
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "stair_id")
  private IfcBuildingStorey ifcBuildingStorey;

  // bi-directional many-to-one association to IfcBuildingStoreyStairRailingPresentationlayer
  @OneToMany(mappedBy = "ifcBuildingStoreyStairRailing")
  private List<IfcBuildingStoreyStairRailingPresentationlayer> ifcBuildingStoreyStairRailingPresentationlayers;

  // bi-directional many-to-one association to IfcBuildingStoreyStairRailingProperty
  @OneToMany(mappedBy = "ifcBuildingStoreyStairRailing")
  private List<IfcBuildingStoreyStairRailingProperty> ifcBuildingStoreyStairRailingProperties;

  public IfcBuildingStoreyStairRailing() {
  }

  public String getId() {
    return this.id;
  }

  public void setId(final String id) {
    this.id = id;
  }

  public Timestamp getCreated() {
    return this.created;
  }

  public void setCreated(final Timestamp created) {
    this.created = created;
  }

  public String getObjectPlacement() {
    return this.objectPlacement;
  }

  public void setObjectPlacement(final String objectPlacement) {
    this.objectPlacement = objectPlacement;
  }

  public String getObjectType() {
    return this.objectType;
  }

  public void setObjectType(final String objectType) {
    this.objectType = objectType;
  }

  public String getRailingName() {
    return this.railingName;
  }

  public void setRailingName(final String railingName) {
    this.railingName = railingName;
  }

  public short getStatus() {
    return this.status;
  }

  public void setStatus(final short status) {
    this.status = status;
  }

  public String getTag() {
    return this.tag;
  }

  public void setTag(final String tag) {
    this.tag = tag;
  }

  public Timestamp getUpdated() {
    return this.updated;
  }

  public void setUpdated(final Timestamp updated) {
    this.updated = updated;
  }

  public int getVersion() {
    return this.version;
  }

  public void setVersion(final int version) {
    this.version = version;
  }

  public IfcBuildingStorey getIfcBuildingStorey() {
    return this.ifcBuildingStorey;
  }

  public void setIfcBuildingStorey(final IfcBuildingStorey ifcBuildingStorey) {
    this.ifcBuildingStorey = ifcBuildingStorey;
  }

  public List<IfcBuildingStoreyStairRailingPresentationlayer> getIfcBuildingStoreyStairRailingPresentationlayers() {
    return this.ifcBuildingStoreyStairRailingPresentationlayers;
  }

  public void
         setIfcBuildingStoreyStairRailingPresentationlayers(final List<IfcBuildingStoreyStairRailingPresentationlayer> ifcBuildingStoreyStairRailingPresentationlayers) {
    this.ifcBuildingStoreyStairRailingPresentationlayers = ifcBuildingStoreyStairRailingPresentationlayers;
  }

  public IfcBuildingStoreyStairRailingPresentationlayer
         addIfcBuildingStoreyStairRailingPresentationlayer(final IfcBuildingStoreyStairRailingPresentationlayer ifcBuildingStoreyStairRailingPresentationlayer) {
    getIfcBuildingStoreyStairRailingPresentationlayers().add(ifcBuildingStoreyStairRailingPresentationlayer);
    ifcBuildingStoreyStairRailingPresentationlayer.setIfcBuildingStoreyStairRailing(this);

    return ifcBuildingStoreyStairRailingPresentationlayer;
  }

  public IfcBuildingStoreyStairRailingPresentationlayer
         removeIfcBuildingStoreyStairRailingPresentationlayer(final IfcBuildingStoreyStairRailingPresentationlayer ifcBuildingStoreyStairRailingPresentationlayer) {
    getIfcBuildingStoreyStairRailingPresentationlayers().remove(ifcBuildingStoreyStairRailingPresentationlayer);
    ifcBuildingStoreyStairRailingPresentationlayer.setIfcBuildingStoreyStairRailing(null);

    return ifcBuildingStoreyStairRailingPresentationlayer;
  }

  public List<IfcBuildingStoreyStairRailingProperty> getIfcBuildingStoreyStairRailingProperties() {
    return this.ifcBuildingStoreyStairRailingProperties;
  }

  public void
         setIfcBuildingStoreyStairRailingProperties(final List<IfcBuildingStoreyStairRailingProperty> ifcBuildingStoreyStairRailingProperties) {
    this.ifcBuildingStoreyStairRailingProperties = ifcBuildingStoreyStairRailingProperties;
  }

  public IfcBuildingStoreyStairRailingProperty
         addIfcBuildingStoreyStairRailingProperty(final IfcBuildingStoreyStairRailingProperty ifcBuildingStoreyStairRailingProperty) {
    getIfcBuildingStoreyStairRailingProperties().add(ifcBuildingStoreyStairRailingProperty);
    ifcBuildingStoreyStairRailingProperty.setIfcBuildingStoreyStairRailing(this);

    return ifcBuildingStoreyStairRailingProperty;
  }

  public IfcBuildingStoreyStairRailingProperty
         removeIfcBuildingStoreyStairRailingProperty(final IfcBuildingStoreyStairRailingProperty ifcBuildingStoreyStairRailingProperty) {
    getIfcBuildingStoreyStairRailingProperties().remove(ifcBuildingStoreyStairRailingProperty);
    ifcBuildingStoreyStairRailingProperty.setIfcBuildingStoreyStairRailing(null);

    return ifcBuildingStoreyStairRailingProperty;
  }

}
