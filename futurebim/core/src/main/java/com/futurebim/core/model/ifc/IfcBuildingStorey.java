package com.futurebim.core.model.ifc;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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
 * The persistent class for the ifc_building_storey database table.
 *
 */
@Entity
@Table(name = "ifc_building_storey")
public class IfcBuildingStorey extends SerializableModelBase {

  private static final long serialVersionUID = 1L;

  @Id
  private String id;

  @Column(name = "composition_type")
  private String compositionType;

  private LocalDateTime created;

  private String elevation;

  @Column(name = "object_placement")
  private String objectPlacement;

  @Column(name = "building_id")
  private String buildingId;

  private short status = 1;

  @Column(name = "storey_name")
  private String storeyName;

  private LocalDateTime updated;

  private int version = 1;

  // bi-directional many-to-one association to IfcBuilding
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "building_id", insertable = false, updatable = false)
  private IfcBuilding ifcBuilding;

  // bi-directional many-to-one association to IfcBuildingStoreyBeam
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyBeam> ifcBuildingStoreyBeams = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyCovering
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyCovering> ifcBuildingStoreyCoverings = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyDoor
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyDoor> ifcBuildingStoreyDoors = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyProperty
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyProperty> ifcBuildingStoreyProperties = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreySlab
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreySlab> ifcBuildingStoreySlabs = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreySpace
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreySpace> ifcBuildingStoreySpaces = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyStair
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyStair> ifcBuildingStoreyStairs = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyStairFlight
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyStairFlight> ifcBuildingStoreyStairFlights = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyStairMember
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyStairMember> ifcBuildingStoreyStairMembers = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyStairRailing
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyStairRailing> ifcBuildingStoreyStairRailings = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyWall
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyWall> ifcBuildingStoreyWalls = new ArrayList<>();

  // bi-directional many-to-one association to IfcBuildingStoreyWindow
  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyWindow> ifcBuildingStoreyWindows = new ArrayList<>();

  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyWallstandardcase> ifcBuildingStoreyWallCases = new ArrayList<>();

  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private List<IfcBuildingStoreyFooting> ifcBuildingStoreyFootings = new ArrayList<>();

  @OneToMany(mappedBy = "ifcBuildingStorey", cascade = CascadeType.ALL)
  private final List<IfcBuildingStoreyRoof> ifcBuildingStoreyRoofs = new ArrayList<>();

  public IfcBuildingStorey() {
  }

  public String getId() {
    return this.id;
  }

  public void setId(final String id) {
    this.id = id;
  }

  public String getCompositionType() {
    return this.compositionType;
  }

  public void setCompositionType(final String compositionType) {
    this.compositionType = compositionType;
  }

  public LocalDateTime getCreated() {
    return this.created;
  }

  public void setCreated(final LocalDateTime created) {
    this.created = created;
  }

  public String getElevation() {
    return this.elevation;
  }

  public void setElevation(final String elevation) {
    this.elevation = elevation;
  }

  public String getObjectPlacement() {
    return this.objectPlacement;
  }

  public void setObjectPlacement(final String objectPlacement) {
    this.objectPlacement = objectPlacement;
  }

  public short getStatus() {
    return this.status;
  }

  public void setStatus(final short status) {
    this.status = status;
  }

  public String getStoreyName() {
    return this.storeyName;
  }

  public void setStoreyName(final String storeyName) {
    this.storeyName = storeyName;
  }

  public LocalDateTime getUpdated() {
    return this.updated;
  }

  public void setUpdated(final LocalDateTime updated) {
    this.updated = updated;
  }

  public int getVersion() {
    return this.version;
  }

  public void setVersion(final int version) {
    this.version = version;
  }

  public IfcBuilding getIfcBuilding() {
    return this.ifcBuilding;
  }

  public void setIfcBuilding(final IfcBuilding ifcBuilding) {
    this.ifcBuilding = ifcBuilding;
  }

  public List<IfcBuildingStoreyBeam> getIfcBuildingStoreyBeams() {
    return this.ifcBuildingStoreyBeams;
  }

  public void setIfcBuildingStoreyBeams(final List<IfcBuildingStoreyBeam> ifcBuildingStoreyBeams) {
    this.ifcBuildingStoreyBeams = ifcBuildingStoreyBeams;
  }

  public IfcBuildingStoreyBeam addIfcBuildingStoreyBeam(final IfcBuildingStoreyBeam ifcBuildingStoreyBeam) {
    getIfcBuildingStoreyBeams().add(ifcBuildingStoreyBeam);
    ifcBuildingStoreyBeam.setIfcBuildingStorey(this);

    return ifcBuildingStoreyBeam;
  }

  public IfcBuildingStoreyBeam removeIfcBuildingStoreyBeam(final IfcBuildingStoreyBeam ifcBuildingStoreyBeam) {
    getIfcBuildingStoreyBeams().remove(ifcBuildingStoreyBeam);
    ifcBuildingStoreyBeam.setIfcBuildingStorey(null);

    return ifcBuildingStoreyBeam;
  }

  public List<IfcBuildingStoreyCovering> getIfcBuildingStoreyCoverings() {
    return this.ifcBuildingStoreyCoverings;
  }

  public void setIfcBuildingStoreyCoverings(final List<IfcBuildingStoreyCovering> ifcBuildingStoreyCoverings) {
    this.ifcBuildingStoreyCoverings = ifcBuildingStoreyCoverings;
  }

  public IfcBuildingStoreyCovering addIfcBuildingStoreyCovering(final IfcBuildingStoreyCovering ifcBuildingStoreyCovering) {
    getIfcBuildingStoreyCoverings().add(ifcBuildingStoreyCovering);
    ifcBuildingStoreyCovering.setIfcBuildingStorey(this);

    return ifcBuildingStoreyCovering;
  }

  public IfcBuildingStoreyCovering removeIfcBuildingStoreyCovering(final IfcBuildingStoreyCovering ifcBuildingStoreyCovering) {
    getIfcBuildingStoreyCoverings().remove(ifcBuildingStoreyCovering);
    ifcBuildingStoreyCovering.setIfcBuildingStorey(null);

    return ifcBuildingStoreyCovering;
  }

  public List<IfcBuildingStoreyDoor> getIfcBuildingStoreyDoors() {
    return this.ifcBuildingStoreyDoors;
  }

  public void setIfcBuildingStoreyDoors(final List<IfcBuildingStoreyDoor> ifcBuildingStoreyDoors) {
    this.ifcBuildingStoreyDoors = ifcBuildingStoreyDoors;
  }

  public IfcBuildingStoreyDoor addIfcBuildingStoreyDoor(final IfcBuildingStoreyDoor ifcBuildingStoreyDoor) {
    getIfcBuildingStoreyDoors().add(ifcBuildingStoreyDoor);
    ifcBuildingStoreyDoor.setIfcBuildingStorey(this);

    return ifcBuildingStoreyDoor;
  }

  public IfcBuildingStoreyDoor removeIfcBuildingStoreyDoor(final IfcBuildingStoreyDoor ifcBuildingStoreyDoor) {
    getIfcBuildingStoreyDoors().remove(ifcBuildingStoreyDoor);
    ifcBuildingStoreyDoor.setIfcBuildingStorey(null);

    return ifcBuildingStoreyDoor;
  }

  public List<IfcBuildingStoreyProperty> getIfcBuildingStoreyProperties() {
    return this.ifcBuildingStoreyProperties;
  }

  public void setIfcBuildingStoreyProperties(final List<IfcBuildingStoreyProperty> ifcBuildingStoreyProperties) {
    this.ifcBuildingStoreyProperties = ifcBuildingStoreyProperties;
  }

  public IfcBuildingStoreyProperty addIfcBuildingStoreyProperty(final IfcBuildingStoreyProperty ifcBuildingStoreyProperty) {
    getIfcBuildingStoreyProperties().add(ifcBuildingStoreyProperty);
    ifcBuildingStoreyProperty.setIfcBuildingStorey(this);

    return ifcBuildingStoreyProperty;
  }

  public IfcBuildingStoreyProperty removeIfcBuildingStoreyProperty(final IfcBuildingStoreyProperty ifcBuildingStoreyProperty) {
    getIfcBuildingStoreyProperties().remove(ifcBuildingStoreyProperty);
    ifcBuildingStoreyProperty.setIfcBuildingStorey(null);

    return ifcBuildingStoreyProperty;
  }

  public List<IfcBuildingStoreySlab> getIfcBuildingStoreySlabs() {
    return this.ifcBuildingStoreySlabs;
  }

  public void setIfcBuildingStoreySlabs(final List<IfcBuildingStoreySlab> ifcBuildingStoreySlabs) {
    this.ifcBuildingStoreySlabs = ifcBuildingStoreySlabs;
  }

  public IfcBuildingStoreySlab addIfcBuildingStoreySlab(final IfcBuildingStoreySlab ifcBuildingStoreySlab) {
    getIfcBuildingStoreySlabs().add(ifcBuildingStoreySlab);
    ifcBuildingStoreySlab.setIfcBuildingStorey(this);

    return ifcBuildingStoreySlab;
  }

  public IfcBuildingStoreySlab removeIfcBuildingStoreySlab(final IfcBuildingStoreySlab ifcBuildingStoreySlab) {
    getIfcBuildingStoreySlabs().remove(ifcBuildingStoreySlab);
    ifcBuildingStoreySlab.setIfcBuildingStorey(null);

    return ifcBuildingStoreySlab;
  }

  public List<IfcBuildingStoreySpace> getIfcBuildingStoreySpaces() {
    return this.ifcBuildingStoreySpaces;
  }

  public void setIfcBuildingStoreySpaces(final List<IfcBuildingStoreySpace> ifcBuildingStoreySpaces) {
    this.ifcBuildingStoreySpaces = ifcBuildingStoreySpaces;
  }

  public IfcBuildingStoreySpace addIfcBuildingStoreySpace(final IfcBuildingStoreySpace ifcBuildingStoreySpace) {
    getIfcBuildingStoreySpaces().add(ifcBuildingStoreySpace);
    ifcBuildingStoreySpace.setIfcBuildingStorey(this);

    return ifcBuildingStoreySpace;
  }

  public IfcBuildingStoreySpace removeIfcBuildingStoreySpace(final IfcBuildingStoreySpace ifcBuildingStoreySpace) {
    getIfcBuildingStoreySpaces().remove(ifcBuildingStoreySpace);
    ifcBuildingStoreySpace.setIfcBuildingStorey(null);

    return ifcBuildingStoreySpace;
  }

  public List<IfcBuildingStoreyStair> getIfcBuildingStoreyStairs() {
    return this.ifcBuildingStoreyStairs;
  }

  public void setIfcBuildingStoreyStairs(final List<IfcBuildingStoreyStair> ifcBuildingStoreyStairs) {
    this.ifcBuildingStoreyStairs = ifcBuildingStoreyStairs;
  }

  public IfcBuildingStoreyStair addIfcBuildingStoreyStair(final IfcBuildingStoreyStair ifcBuildingStoreyStair) {
    getIfcBuildingStoreyStairs().add(ifcBuildingStoreyStair);
    ifcBuildingStoreyStair.setIfcBuildingStorey(this);

    return ifcBuildingStoreyStair;
  }

  public IfcBuildingStoreyStair removeIfcBuildingStoreyStair(final IfcBuildingStoreyStair ifcBuildingStoreyStair) {
    getIfcBuildingStoreyStairs().remove(ifcBuildingStoreyStair);
    ifcBuildingStoreyStair.setIfcBuildingStorey(null);

    return ifcBuildingStoreyStair;
  }

  public List<IfcBuildingStoreyStairFlight> getIfcBuildingStoreyStairFlights() {
    return this.ifcBuildingStoreyStairFlights;
  }

  public void setIfcBuildingStoreyStairFlights(final List<IfcBuildingStoreyStairFlight> ifcBuildingStoreyStairFlights) {
    this.ifcBuildingStoreyStairFlights = ifcBuildingStoreyStairFlights;
  }

  public IfcBuildingStoreyStairFlight addIfcBuildingStoreyStairFlight(final IfcBuildingStoreyStairFlight ifcBuildingStoreyStairFlight) {
    getIfcBuildingStoreyStairFlights().add(ifcBuildingStoreyStairFlight);
    ifcBuildingStoreyStairFlight.setIfcBuildingStorey(this);

    return ifcBuildingStoreyStairFlight;
  }

  public IfcBuildingStoreyStairFlight removeIfcBuildingStoreyStairFlight(final IfcBuildingStoreyStairFlight ifcBuildingStoreyStairFlight) {
    getIfcBuildingStoreyStairFlights().remove(ifcBuildingStoreyStairFlight);
    ifcBuildingStoreyStairFlight.setIfcBuildingStorey(null);

    return ifcBuildingStoreyStairFlight;
  }

  public List<IfcBuildingStoreyStairMember> getIfcBuildingStoreyStairMembers() {
    return this.ifcBuildingStoreyStairMembers;
  }

  public void setIfcBuildingStoreyStairMembers(final List<IfcBuildingStoreyStairMember> ifcBuildingStoreyStairMembers) {
    this.ifcBuildingStoreyStairMembers = ifcBuildingStoreyStairMembers;
  }

  public IfcBuildingStoreyStairMember addIfcBuildingStoreyStairMember(final IfcBuildingStoreyStairMember ifcBuildingStoreyStairMember) {
    getIfcBuildingStoreyStairMembers().add(ifcBuildingStoreyStairMember);
    ifcBuildingStoreyStairMember.setIfcBuildingStorey(this);

    return ifcBuildingStoreyStairMember;
  }

  public IfcBuildingStoreyStairMember removeIfcBuildingStoreyStairMember(final IfcBuildingStoreyStairMember ifcBuildingStoreyStairMember) {
    getIfcBuildingStoreyStairMembers().remove(ifcBuildingStoreyStairMember);
    ifcBuildingStoreyStairMember.setIfcBuildingStorey(null);

    return ifcBuildingStoreyStairMember;
  }

  public List<IfcBuildingStoreyStairRailing> getIfcBuildingStoreyStairRailings() {
    return this.ifcBuildingStoreyStairRailings;
  }

  public void setIfcBuildingStoreyStairRailings(final List<IfcBuildingStoreyStairRailing> ifcBuildingStoreyStairRailings) {
    this.ifcBuildingStoreyStairRailings = ifcBuildingStoreyStairRailings;
  }

  public IfcBuildingStoreyStairRailing addIfcBuildingStoreyStairRailing(final IfcBuildingStoreyStairRailing ifcBuildingStoreyStairRailing) {
    getIfcBuildingStoreyStairRailings().add(ifcBuildingStoreyStairRailing);
    ifcBuildingStoreyStairRailing.setIfcBuildingStorey(this);

    return ifcBuildingStoreyStairRailing;
  }

  public IfcBuildingStoreyStairRailing
         removeIfcBuildingStoreyStairRailing(final IfcBuildingStoreyStairRailing ifcBuildingStoreyStairRailing) {
    getIfcBuildingStoreyStairRailings().remove(ifcBuildingStoreyStairRailing);
    ifcBuildingStoreyStairRailing.setIfcBuildingStorey(null);

    return ifcBuildingStoreyStairRailing;
  }

  public List<IfcBuildingStoreyWall> getIfcBuildingStoreyWalls() {
    return this.ifcBuildingStoreyWalls;
  }

  public void setIfcBuildingStoreyWalls(final List<IfcBuildingStoreyWall> ifcBuildingStoreyWalls) {
    this.ifcBuildingStoreyWalls = ifcBuildingStoreyWalls;
  }

  public IfcBuildingStoreyWall addIfcBuildingStoreyWall(final IfcBuildingStoreyWall ifcBuildingStoreyWall) {
    getIfcBuildingStoreyWalls().add(ifcBuildingStoreyWall);
    ifcBuildingStoreyWall.setIfcBuildingStorey(this);

    return ifcBuildingStoreyWall;
  }

  public IfcBuildingStoreyWall removeIfcBuildingStoreyWall(final IfcBuildingStoreyWall ifcBuildingStoreyWall) {
    getIfcBuildingStoreyWalls().remove(ifcBuildingStoreyWall);
    ifcBuildingStoreyWall.setIfcBuildingStorey(null);

    return ifcBuildingStoreyWall;
  }

  public List<IfcBuildingStoreyWindow> getIfcBuildingStoreyWindows() {
    return this.ifcBuildingStoreyWindows;
  }

  public void setIfcBuildingStoreyWindows(final List<IfcBuildingStoreyWindow> ifcBuildingStoreyWindows) {
    this.ifcBuildingStoreyWindows = ifcBuildingStoreyWindows;
  }

  public IfcBuildingStoreyWindow addIfcBuildingStoreyWindow(final IfcBuildingStoreyWindow ifcBuildingStoreyWindow) {
    getIfcBuildingStoreyWindows().add(ifcBuildingStoreyWindow);
    ifcBuildingStoreyWindow.setIfcBuildingStorey(this);

    return ifcBuildingStoreyWindow;
  }

  public IfcBuildingStoreyWindow removeIfcBuildingStoreyWindow(final IfcBuildingStoreyWindow ifcBuildingStoreyWindow) {
    getIfcBuildingStoreyWindows().remove(ifcBuildingStoreyWindow);
    ifcBuildingStoreyWindow.setIfcBuildingStorey(null);

    return ifcBuildingStoreyWindow;
  }

  public String getBuildingId() {
    return buildingId;
  }

  public void setBuildingId(final String buildingId) {
    this.buildingId = buildingId;
  }

  public List<IfcBuildingStoreyWallstandardcase> getIfcBuildingStoreyWallCases() {
    return ifcBuildingStoreyWallCases;
  }

  public void setIfcBuildingStoreyWallCases(final List<IfcBuildingStoreyWallstandardcase> ifcBuildingStoreyWallCases) {
    this.ifcBuildingStoreyWallCases = ifcBuildingStoreyWallCases;
  }

  public void addIfcBuildingStoreyWallCase(final IfcBuildingStoreyWallstandardcase ifcBuildingStoreyWallCase) {
    ifcBuildingStoreyWallCase.setIfcBuildingStorey(this);
    this.ifcBuildingStoreyWallCases.add(ifcBuildingStoreyWallCase);
  }

  public List<IfcBuildingStoreyFooting> getIfcBuildingStoreyFootings() {
    return ifcBuildingStoreyFootings;
  }

  public void setIfcBuildingStoreyFootings(final List<IfcBuildingStoreyFooting> ifcBuildingStoreyFootings) {
    this.ifcBuildingStoreyFootings = ifcBuildingStoreyFootings;
  }

  public void addIfcBuildingStoreyFooting(final IfcBuildingStoreyFooting ifcBuildingStoreyFooting) {
    ifcBuildingStoreyFooting.setIfcBuildingStorey(this);
    this.ifcBuildingStoreyFootings.add(ifcBuildingStoreyFooting);
  }

}
