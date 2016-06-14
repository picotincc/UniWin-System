/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/3/4 16:04:51                            */
/*==============================================================*/


drop table if exists BOM;

drop table if exists QC;

drop table if exists abnormalParameter;

drop table if exists authority;

drop table if exists customer;

drop table if exists department;

drop table if exists design;

drop table if exists designVendor;

drop table if exists inquiry;

drop table if exists inquiryDetail;

drop table if exists inquiryMaterial;

drop table if exists material;

drop table if exists materialApply;

drop table if exists materialInput;

drop table if exists materialOutput;

drop table if exists modelCondition;

drop table if exists module;

drop table if exists orderDetail;

drop table if exists orderMaterialDetail;

drop table if exists orders;

drop table if exists outsource;

drop table if exists outsourceDetail;

drop table if exists phasesCondition;

drop table if exists processor;

drop table if exists production;

drop table if exists purchase;

drop table if exists purchaseVendor;

drop table if exists receive;

drop table if exists receiveDetail;

drop table if exists role;

drop table if exists roleAuthority;

drop table if exists sample;

drop table if exists sampleOrder;

drop table if exists sampleProcedure;

drop table if exists sampleStorageDetail;

drop table if exists specificTechnique;

drop table if exists store;

drop table if exists supplement;

drop table if exists supplementMaterial;

drop table if exists supply;

drop table if exists tailor;

drop table if exists technique;

drop table if exists techniqueCondition;

drop table if exists techniqueInventory;

drop table if exists techniquePhase;

drop table if exists user;

drop table if exists userRole;

drop table if exists vendor;

drop table if exists warehouse;

/*==============================================================*/
/* Table: BOM                                                   */
/*==============================================================*/
create table BOM
(
   materialCode         varchar(16) not null,
   designID             int not null,
   volPerDesign			double not null default 0.0,
   materialPosition		varchar(5) not null,
   primary key (materialCode, designID)
);

alter table BOM comment '款式物料表';

/*==============================================================*/
/* Table: QC                                                    */
/*==============================================================*/
create table QC
(
   QCID                 int not null auto_increment,
   QCCode				varchar(25) not null,
   userId               int,
   productionID         int not null,
   QCComment            varchar(30),
   QCStages             varchar(50) not null,
   QCDesignateTime      datetime default null,
   QCState              varchar(5) not null,
   QCResult             varchar(100),
   primary key (QCID)
);

alter table QC comment '质检单';

/*==============================================================*/
/* Table: abnormalParameter                                     */
/*==============================================================*/
create table abnormalParameter
(
   abnormalParameterID  int not null auto_increment,
   abParaName           varchar(20) not null,
   abParaValue          float(4) not null,
   primary key (abnormalParameterID)
);

alter table abnormalParameter comment '系统异常参数表';

/*==============================================================*/
/* Table: authority                                             */
/*==============================================================*/
create table authority
(
   authorityID          int not null auto_increment,
   middleAuthName       varchar(20),
   highAuthName         varchar(20),
   lowAuthName          varchar(20),
   authDescription      varchar(20),
   authorityEnabled		bool default 1,
   primary key (authorityID)
);

alter table authority comment '底层权限表';

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   customerID           int not null auto_increment,
   customerContactName  varchar(10),
   customerBrandName    varchar(15),
   customerType         varchar(10) not null,
   customerPhone        varchar(15),
   customerEMail        varchar(20),
   customerState        varchar(8) not null,
   customerAddress		varchar(40),
   primary key (customerID)
);

alter table customer comment '客户表';

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   departmentID         int not null auto_increment,
   departmentFullName   varchar(10) not null,
   departmentEnName     varchar(40),
   departmentAbbrName   varchar(10),
   departmentPhone      varchar(15),
   departmentDescription varchar(20),
   primary key (departmentID)
);

alter table department comment '部门表';

/*==============================================================*/
/* Table: design                                                */
/*==============================================================*/
create table design
(
   designID             int not null auto_increment,
   designCode           varchar(20) not null,
   designName           varchar(20) not null,
   designPicURL         varchar(300),
   designProcessPrice   float(8),
   designTechProcedure  varchar(20),
   designPutawayDate    date not null,
   designColorDescription varchar(20) not null,
   designComment        varchar(30),
   designsewninCode     varchar(20),
   designMainLabelCode  varchar(20),
   designHangTagCode    varchar(20),
   designFlagShipURL    varchar(300) not null,
   designType			varchar(20) not null,
   primary key (designID),
   unique (designCode)
);

alter table design comment '款式表';

/*==============================================================*/
/* Table: designVendor                                          */
/*==============================================================*/
create table designVendor
(
   vendorId             int not null,
   designID             int not null,
   primary key (vendorId, designID)
);

alter table designVendor comment '款式供应商表';

/*==============================================================*/
/* Table: inquiry                                               */
/*==============================================================*/
create table inquiry
(
   inquiryID            int not null auto_increment,
   designID             int,
   inquiryCode          varchar(30) not null,
   inquiryMaterialSample varchar(20),
   inquiryTotal         int,
   inquiryProcessCycle  int,
   inquiryUnitPrice     float(8),
   shellOKTime			datetime default null,
   accOKTime			datetime default null,
   flowerOKTime			datetime default null,
   modelOKTime			datetime default null,
   processOKTime		datetime default null,
   primary key (inquiryID)
);

alter table inquiry comment '询价单';

/*==============================================================*/
/* Table: inquiryDetail                                         */
/*==============================================================*/
create table inquiryDetail
(
   inquiryDetailID      int not null auto_increment,
   inquiryID            int not null,
   inquiryPrintCost     float(5) not null default 0.0,
   inquiryTime          int not null,
   inquirySampleCost    float(5) not null default 0.0,
   inquiryProcessCost   float(5) not null default 0.0,
   inquiryDetailCycle   int,
   inquirySampleCycle   int,
   inquiryShellComment  varchar(20),
   inquiryAccComment    varchar(20),
   primary key (inquiryDetailID),
   unique (inquiryID)
);

alter table inquiryDetail comment '询价单其他信息表';

/*==============================================================*/
/* Table: inquiryMaterial                                       */
/*==============================================================*/
create table inquiryMaterial
(
   inquiryMaterialID    int not null auto_increment,
   inquiryID            int not null,
   materialCode         varchar(16) not null,
   inquiryMaterialUnitVol int not null default 0,
   primary key (inquiryMaterialID)
);

alter table inquiryMaterial comment '询价单面辅料信息表';

/*==============================================================*/
/* Table: material                                              */
/*==============================================================*/
create table material
(
   materialCode         varchar(16) not null,
   materialName         varchar(20) not null,
   materialType         varchar(15),
   colorCode            varchar(10),
   colorDescription     varchar(20) not null,
   materialIngredient   varchar(20) not null,
   unitPrice            float(10) not null,
   unit                 varchar(5),
   width                float(10) not null,
   outputVol            float(10),
   modificationDate     date not null,
   shellAccessoryType		varchar(5),
   primary key (materialCode)
);

alter table material comment '物料表';

/*==============================================================*/
/* Table: materialApply                                         */
/*==============================================================*/
create table materialApply
(
   materialApplyID      int not null auto_increment,
   materialCode         varchar(16) not null,
   userId               int not null,
   materialApplyCode    varchar(10) not null,
   materialApplyVol     int not null default 0,
   matrialApplyDate     date not null,
   applyComment         varchar(20),
   primary key (materialApplyID)
);

alter table materialApply comment '物料申请单';

/*==============================================================*/
/* Table: materialInput                                         */
/*==============================================================*/
create table materialInput
(
   materialInputID      int not null auto_increment,
   warehouseid          int not null,
   materialCode         varchar(16) not null,
   userId               int not null,
   purchaseID           int,
   supplementID         int,
   materialInputDate    date not null,
   materialInputVol     int not null,
   materialInputComment varchar(20),
   primary key (materialInputID)
);

alter table materialInput comment '入库单';

/*==============================================================*/
/* Table: materialOutput                                        */
/*==============================================================*/
create table materialOutput
(
   materialOutputID     int not null auto_increment,
   warehouseid          int not null,
   materialCode         varchar(16) not null,
   userId               int not null,
   materialApplyID      int,
   materialOutputDate   date not null,
   materialOutputVol    int not null,
   materialOutputComment varchar(20),
   primary key (materialOutputID)
);

alter table materialOutput comment '出库单';

/*==============================================================*/
/* Table: modelCondition                                        */
/*==============================================================*/
create table modelCondition
(
   modelConditionID     int not null auto_increment,
   modelConditionDate   date not null,
   modelConditionVol    int not null,
   primary key (modelConditionID)
);

alter table modelCondition comment '每日制版单积压状况表';

/*==============================================================*/
/* Table: module                                                */
/*==============================================================*/
create table module
(
   moduleID             int not null auto_increment,
   middleModuleName     varchar(20),
   highModuleName       varchar(20),
   lowModuleName        varchar(20),
   moduleNum            int,
   moduleRoute          varchar(30),
   moduleOwnCode        varchar(25),
   moduleEnabled        bool not null default true,
   moduleSpecification  varchar(30),
   primary key (moduleID)
);

alter table module comment '底层模组表';

/*==============================================================*/
/* Table: orderDetail                                           */
/*==============================================================*/
create table orderDetail
(
   orderDetailID        int not null auto_increment,
   orderID              int not null,
   orderColor           varchar(20),
   orderXS              int not null default 0,
   orderS               int not null default 0,
   orderM               int not null default 0,
   orderL               int not null default 0,
   orderXL              int not null default 0,
   orderXXL             int not null default 0,
   primary key (orderDetailID)
);

alter table orderDetail comment '客户订单颜色表';

/*==============================================================*/
/* Table: orderMaterialDetail                                   */
/*==============================================================*/
create table orderMaterialDetail
(
   orderMaterialID      int not null auto_increment,
   orderID              int not null,
   supplyID             int not null,
   orderMaterialAttr    varchar(10),
   orderVol             int not null default 0,
   orderComment         varchar(50),
   primary key (orderMaterialID)
);

alter table orderMaterialDetail comment '订单物料详情表';

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderID              int not null auto_increment,
   orderMakerId         int not null,
   customerID           int not null,
   chargeId             int,
   productionID         int,
   inquiryID            int,
   sampleID             int,
   designID             int,
   orderCode            varchar(30) not null,
   orderDesignatedTime  datetime default null,
   orderDate            datetime not null,
   orderFinishDate      date,
   orderRefURL          varchar(50),
   orderSampleYardage   varchar(5),
   orderSewnInLabelReq  varchar(20),
   orderTechReq         varchar(20),
   orderComment         varchar(50),
   orderPriority        varchar(5) not null,
   orderSource          varchar(10),
   orderDesignIsNew     bool,
   orderContractNum     varchar(20),
   orderProcessType     varchar(5) not null,
   orderType            varchar(5) not null,
   orderSpecialTech     varchar(10),
   orderShellIngredient varchar(10),
   orderChecked			bool not null default 0,
   distributeMethod		varchar(30),
   primary key (orderID),
   unique (inquiryID,sampleID)
);

alter table orders comment '客户订单表';

/*==============================================================*/
/* Table: outsource                                             */
/*==============================================================*/
create table outsource
(
   outsourceID          int not null auto_increment,
   userId               int,
   processorID          int not null,
   productionID         int,
   designID             int not null,
   outsourceCode        varchar(25) not null,
   finishDate           date not null,
   osScheduleDate       date not null,
   labourCost           float(10),
   actualOutDate        date,
   referenceOutDate     date,
   outsourceState       varchar(10),
   primary key (outsourceID)
);

alter table outsource comment '外发单';

/*==============================================================*/
/* Table: outsourceDetail                                       */
/*==============================================================*/
create table outsourceDetail
(
   outsourceDetailID    int not null auto_increment,
   outsourceID          int not null,
   outsourceColor       varchar(10),
   outsourceXS          int not null default 0,
   outsourceS           int not null default 0,
   outsourceM           int not null default 0,
   outsourceL           int not null default 0,
   outsourceXL          int not null default 0,
   outsourceXXL         int not null default 0,
   outsourceTotal       int not null default 0,
   primary key (outsourceDetailID)
);

alter table outsourceDetail comment '外发信息详细表';

/*==============================================================*/
/* Table: phasesCondition                                       */
/*==============================================================*/
create table phasesCondition
(
   phasesConditionID    int not null auto_increment,
   phaseName            varchar(25) not null,
   phasesConditionDate  date not null,
   phasesConditionVol   int not null,
   primary key (phasesConditionID)
);

alter table phasesCondition comment '各环节订单积压状况表';

/*==============================================================*/
/* Table: processor                                             */
/*==============================================================*/
create table processor
(
   processorID          int not null auto_increment,
   processorCode        varchar(15) not null,
   processorName        varchar(16) not null,
   processorState       varchar(10) not null,
   processorInitialPassword varchar(10) not null,
   processorMobileNum   varchar(20) not null,
   processorRank        varchar(8) not null,
   processorAddr        varchar(35) not null,
   processorWorkerNum   int not null,
   processorDistrict    varchar(10) not null,
   deliveryType         varchar(8) not null,
   startingDate         date not null,
   processorComment     varchar(20),
   primary key (processorID)
);

alter table processor comment '加工方';

/*==============================================================*/
/* Table: production                                            */
/*==============================================================*/
create table production
(
   productionID         int not null auto_increment,
   productionCode       varchar(20) not null,
   productionState      varchar(10) not null,
   productionProgress   varchar(10) not null,
   pProcessTime			datetime default null,
   pOutsourceTime		datetime default null,
   pPartReceiveTime		datetime default null,
   pReceiveTime 		datetime default null,
   pQCTime 				datetime default null,
   pFinishQCTime		datetime default null,
   primary key (productionID)
);

alter table production comment '生产单表';

/*==============================================================*/
/* Table: purchase                                              */
/*==============================================================*/
create table purchase
(
   purchaseID           int not null auto_increment,
   userId               int not null,
   productionID         int,
   purchaseCode         varchar(25) not null,
   ETA                  date,
   ScheduledPurchaseDate date,
   purDocumentedDate    date not null,
   purchaseComment      varchar(20),
   purchaseState        varchar(15) not null,
   purchaseType		 	varchar(10) not null,
   materialExamineTime  datetime default null,
   warehouseExamineTime datetime default null,
   phoneOrderTime		datetime default null,
   faxTime				datetime default null,
   financeCheckTime		datetime default null,
   materialCheckTime	datetime default null,
   primary key (purchaseID),
   unique (purchaseCode)
);

alter table purchase comment '采购单';

/*==============================================================*/
/* Table: purchaseVendor                                        */
/*==============================================================*/
create table purchaseVendor
(
   vendorId             int not null,
   purchaseID           int not null,
   primary key (vendorId, purchaseID)
);

alter table purchaseVendor comment '采购单供应商对应表';

/*==============================================================*/
/* Table: receive                                               */
/*==============================================================*/
create table receive
(
   receiveID            int not null auto_increment,
   userId               int not null,
   processorID          int not null,
   outsourceID          int,
   receiveDate          date not null,
   receiveType          varchar(8) not null,
   primary key (receiveID)
);

alter table receive comment '收货单表';

/*==============================================================*/
/* Table: receiveDetail                                         */
/*==============================================================*/
create table receiveDetail
(
   receiveDetailID      int not null auto_increment,
   receiveID            int not null,
   receiveColor         varchar(10),
   receiveXS            int not null default 0,
   receiveS             int not null default 0,
   receiveM             int not null default 0,
   receiveL             int not null default 0,
   receiveXL            int not null default 0,
   receiveXXL           int not null default 0,
   primary key (receiveDetailID)
);

alter table receiveDetail comment '收货信息详细表';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   roleID               int not null auto_increment,
   roleName             varchar(15) not null,
   roleDescription      varchar(15),
   primary key (roleID)
);

alter table role comment '角色表';

/*==============================================================*/
/* Table: roleAuthority                                         */
/*==============================================================*/
create table roleAuthority
(
   roleAuthID           int not null auto_increment,
   roleID               int not null,
   authorityID          int not null,
   primary key (roleAuthID)
);

alter table roleAuthority comment '角色权限表';

/*==============================================================*/
/* Table: sample                                                */
/*==============================================================*/
create table sample
(
   sampleID             int not null auto_increment,
   designID             int not null,
   samplePlace          varchar(10) not null,
   sampleState          varchar(4) not null,
   primary key (sampleID)
);

alter table sample comment '样衣表';

/*==============================================================*/
/* Table: sampleOrder                                           */
/*==============================================================*/
create table sampleOrder
(
   sampleOrderID        int not null auto_increment,
   designID             int,
   userId               int,
   sampleOrderCode      varchar(30),
   sampleOrderSample    varchar(10),
   sampleOrderSource    varchar(10) not null,
   sampleOrderTime      datetime not null,
   sampleOrderShellFabReq varchar(10),
   sampleOrderAccReq    varchar(10),
   sampleOrderTechReq   varchar(10),
   sampleOrderModOpinion varchar(30),
   sampleOrderComment   varchar(20),
   primary key (sampleOrderID)
);

alter table sampleOrder comment '样衣单表';

/*==============================================================*/
/* Table: sampleProcedure                                       */
/*==============================================================*/
create table sampleProcedure
(
   sampleProcedureID    int not null auto_increment,
   sampleOrderID        int,
   sampleProModelTime   datetime default null,
   sampleProMakeTime    datetime default null,
   sampleProConfirmTime datetime default null,
   sampleProGradingTime datetime default null,
   sampleProExamineTime datetime default null,
   sampleProFinishTime  datetime default null,
   primary key (sampleProcedureID),
   unique (sampleOrderID)
);

alter table sampleProcedure comment '样衣工序表';

/*==============================================================*/
/* Table: sampleStorageDetail                                   */
/*==============================================================*/
create table sampleStorageDetail
(
   sampleStorageDetailID int not null auto_increment,
   sampleID             int not null,
   sampleOPComment      varchar(20),
   sampleOPType         varchar(10) not null,
   sampleOPTime         datetime not null,
   primary key (sampleStorageDetailID)
);

alter table sampleStorageDetail comment '样衣出入库明细表';

/*==============================================================*/
/* Table: specificTechnique                                     */
/*==============================================================*/
create table specificTechnique
(
   specificTechID       int not null auto_increment,
   techid               int not null,
   specificTechPartName varchar(10) not null,
   specificTechnique    varchar(30) not null,
   primary key (specificTechID)
);

alter table specificTechnique comment '具体工艺表';

/*==============================================================*/
/* Table: store                                                 */
/*==============================================================*/
create table store
(
   warehouseid          int not null,
   materialCode         varchar(16) not null,
   remainVol            float(5) not null default 0.0,
   frozenVol            float(5) not null default 0.0,
   primary key (warehouseid, materialCode)
);

alter table store comment '仓库物料对应表';

/*==============================================================*/
/* Table: supplement                                            */
/*==============================================================*/
create table supplement
(
   supplementID         int not null auto_increment,
   productionID         int,
   userId               int not null,
   supplementCode       varchar(25) not null,
   supplementState      varchar(10) not null,
   supplementType       varchar(10) not null,
   supplementDate       date not null,
   supplementComment    varchar(25),
   primary key (supplementID)
);

alter table supplement comment '补料单';

/*==============================================================*/
/* Table: supplementMaterial                                    */
/*==============================================================*/
create table supplementMaterial
(
   supplementID         int not null,
   supplyID         	int not null,
   materialSpecification varchar(10) not null,
   materialVol          int not null,
   supUsage             varchar(20),
   primary key (supplementID, supplyID)
);

alter table supplementMaterial comment '补料物料表';

/*==============================================================*/
/* Table: supply                                                */
/*==============================================================*/
create table supply
(
   supplyID             int not null auto_increment,
   vendorId             int not null,
   materialCode         varchar(16) not null,
   primary key (supplyID)
);

alter table supply comment '供应表';

/*==============================================================*/
/* Table: tailor                                                */
/*==============================================================*/
create table tailor
(
   tailorID             int not null auto_increment,
   tailorModelMakerID   int,
   productionID         int not null,
   tailorTailID         int,
   actualTailorXS       int not null default 0,
   actualTailorS        int not null default 0,
   actualTailorM        int not null default 0,
   actualTailorL        int not null default 0,
   actualTailorXL       int not null default 0,
   actualTailorXXL      int not null default 0,
   tailorStartingTime   datetime default null,
   tailorEndTime		datetime default null,
   orderDetailID		int,
   primary key (tailorID)
);

alter table tailor comment '裁剪单';

/*==============================================================*/
/* Table: technique                                             */
/*==============================================================*/
create table technique
(
   techid               int not null auto_increment,
   userId               int not null,
   designID             int not null,
   processorID          int not null,
   techCode             varchar(10) not null,
   techDate             date not null,
   technique            varchar(10) not null,
   techShellType        varchar(10) not null,
   techSampleSize       varchar(5) not null,
   techModelFinish      bool not null,
   techJointSize        varchar(15) not null,
   techLineDistance     varchar(10) not null,
   techPressingReq      varchar(20) not null,
   techComment          varchar(30) not null,
   primary key (techid)
);

alter table technique comment '款式工艺单';

/*==============================================================*/
/* Table: techniqueCondition                                    */
/*==============================================================*/
create table techniqueCondition
(
   techConditionID      int not null auto_increment,
   techConditionDate    date not null,
   techConditionVol     int not null,
   primary key (techConditionID)
);

alter table techniqueCondition comment '每日工艺单积压状况表';

/*==============================================================*/
/* Table: techniqueInventory                                    */
/*==============================================================*/
create table techniqueInventory
(
   techInventoryID      int not null auto_increment,
   techid               int not null,
   techInPartName       varchar(10) not null,
   techInMCode          varchar(5) not null,
   techInTolerance      float(5) not null,
   primary key (techInventoryID)
);

alter table techniqueInventory comment '工艺清单';

/*==============================================================*/
/* Table: techniquePhase                                        */
/*==============================================================*/
create table techniquePhase
(
   techPhaseID          int not null auto_increment,
   outsourceID          int,
   techPhaseStartingTime datetime default null,
   techPhaseEndTime		datetime default null,
   primary key (techPhaseID),
   unique (outsourceID)
);

alter table techniquePhase comment '工艺阶段';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userId               int not null auto_increment,
   departmentID         int not null,
   userAccount          varchar(20) not null,
   userName             varchar(10),
   userPassword         varchar(10) not null,
   userAddr             varchar(30),
   userMobileNum        varchar(20),
   userEMail            varchar(40),
   userWeChatNum        varchar(40),
   userComName          varchar(40),
   userComment          varchar(255),
   primary key (userId)
);

alter table user comment '用户表';

/*==============================================================*/
/* Table: userRole                                              */
/*==============================================================*/
create table userRole
(
   userRoleID           int not null auto_increment,
   userId               int not null,
   roleID               int not null,
   primary key (userRoleID)
);

alter table userRole comment '用户角色表';

/*==============================================================*/
/* Table: vendor                                                */
/*==============================================================*/
create table vendor
(
   vendorId             int not null,
   vendorName           varchar(10) not null,
   vendorPhoneNum       varchar(20) not null,
   vendorMobileNum      varchar(20),
   vendorAddr           varchar(40) not null,
   vendorRank           varchar(5) not null,
   vendorArea			varchar(10),
   primary key (vendorId)
);

alter table vendor comment '供应商';

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse
(
   warehouseid          int not null auto_increment,
   location             varchar(50),
   maxCapacity          bigint,
   primary key (warehouseid)
);

alter table warehouse comment '仓库';

alter table BOM add constraint FK_BOM foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table BOM add constraint FK_BOM2 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table QC add constraint FK_Reference_67 foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table QC add constraint FK_check foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table designVendor add constraint FK_designVendor foreign key (vendorId)
      references vendor (vendorId) on delete restrict on update restrict;

alter table designVendor add constraint FK_designVendor2 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table inquiry add constraint FK_of1 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table inquiryDetail add constraint FK_Reference_72 foreign key (inquiryID)
      references inquiry (inquiryID) on delete restrict on update restrict;

alter table inquiryMaterial add constraint FK_of3 foreign key (inquiryID)
      references inquiry (inquiryID) on delete restrict on update restrict;

alter table inquiryMaterial add constraint FK_of4 foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table materialApply add constraint FK_materialApply foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table materialApply add constraint FK_materialApply2 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table materialInput add constraint FK_Reference_54 foreign key (purchaseID)
      references purchase (purchaseID) on delete restrict on update restrict;

alter table materialInput add constraint FK_Reference_55 foreign key (supplementID)
      references supplement (supplementID) on delete restrict on update restrict;

alter table materialInput add constraint FK_charge2 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table materialInput add constraint FK_materialInput foreign key (warehouseid)
      references warehouse (warehouseid) on delete restrict on update restrict;

alter table materialInput add constraint FK_materialInput2 foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table materialOutput add constraint FK_Reference_56 foreign key (materialApplyID)
      references materialApply (materialApplyID) on delete restrict on update restrict;

alter table materialOutput add constraint FK_charge3 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table materialOutput add constraint FK_materialOutput foreign key (warehouseid)
      references warehouse (warehouseid) on delete restrict on update restrict;

alter table materialOutput add constraint FK_materialOutput2 foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table orderDetail add constraint FK_Reference_64 foreign key (orderID)
      references orders (orderID) on delete restrict on update restrict;

alter table orderMaterialDetail add constraint FK_Reference_65 foreign key (orderID)
      references orders (orderID) on delete restrict on update restrict;

alter table orderMaterialDetail add constraint FK_Reference_66 foreign key (supplyID)
      references supply (supplyID) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_61 foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_62 foreign key (inquiryID)
      references inquiry (inquiryID) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_63 foreign key (sampleID)
      references sampleOrder (sampleOrderID) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_74 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table orders add constraint FK_charge5 foreign key (chargeId)
      references user (userId) on delete restrict on update restrict;

alter table orders add constraint FK_getorder foreign key (orderMakerId)
      references user (userId) on delete restrict on update restrict;

alter table orders add constraint FK_order foreign key (customerID)
      references customer (customerID) on delete restrict on update restrict;

alter table outsource add constraint FK_Reference_57 foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table outsource add constraint FK_Reference_73 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table outsource add constraint FK_outsource foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table outsource add constraint FK_outsource2 foreign key (processorID)
      references processor (processorID) on delete restrict on update restrict;

alter table outsourceDetail add constraint FK_Reference_58 foreign key (outsourceID)
      references outsource (outsourceID) on delete restrict on update restrict;

alter table purchase add constraint FK_charge1 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table purchase add constraint FK_of5 foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table purchaseVendor add constraint FK_Reference_75 foreign key (vendorId)
      references vendor (vendorId) on delete restrict on update restrict;

alter table purchaseVendor add constraint FK_Reference_76 foreign key (purchaseID)
      references purchase (purchaseID) on delete restrict on update restrict;

alter table receive add constraint FK_Reference_59 foreign key (outsourceID)
      references outsource (outsourceID) on delete restrict on update restrict;

alter table receive add constraint FK_receive foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table receive add constraint FK_receive2 foreign key (processorID)
      references processor (processorID) on delete restrict on update restrict;

alter table receiveDetail add constraint FK_Reference_60 foreign key (receiveID)
      references receive (receiveID) on delete restrict on update restrict;

alter table roleAuthority add constraint FK_roleAuthority foreign key (roleID)
      references role (roleID) on delete restrict on update restrict;

alter table roleAuthority add constraint FK_roleAuthority2 foreign key (authorityID)
      references authority (authorityID) on delete restrict on update restrict;

alter table sample add constraint FK_has7 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table sampleOrder add constraint FK_Reference_70 foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table sampleOrder add constraint FK_Reference_71 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table sampleProcedure add constraint FK_Reference_69 foreign key (sampleOrderID)
      references sampleOrder (sampleOrderID) on delete restrict on update restrict;

alter table sampleStorageDetail add constraint FK_has8 foreign key (sampleID)
      references sample (sampleID) on delete restrict on update restrict;

alter table specificTechnique add constraint FK_has5 foreign key (techid)
      references technique (techid) on delete restrict on update restrict;

alter table store add constraint FK_store foreign key (warehouseid)
      references warehouse (warehouseid) on delete restrict on update restrict;

alter table store add constraint FK_store2 foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table supplement add constraint FK_charge4 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table supplement add constraint FK_for foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table supplementMaterial add constraint FK_supplementMaterial foreign key (supplementID)
      references supplement (supplementID) on delete restrict on update restrict;

alter table supplementMaterial add constraint FK_supplementMaterial2 foreign key (supplyID)
      references supply (supplyID) on delete restrict on update restrict;

alter table supply add constraint FK_supply foreign key (vendorId)
      references vendor (vendorId) on delete restrict on update restrict;

alter table supply add constraint FK_supply2 foreign key (materialCode)
      references material (materialCode) on delete restrict on update restrict;

alter table tailor add constraint FK_cutout foreign key (tailorTailID)
      references user (userId) on delete restrict on update restrict;

alter table tailor add constraint FK_has foreign key (productionID)
      references production (productionID) on delete restrict on update restrict;

alter table tailor add constraint FK_makeup foreign key (tailorModelMakerID)
      references user (userId) on delete restrict on update restrict;

alter table technique add constraint FK_charge foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table technique add constraint FK_from foreign key (processorID)
      references processor (processorID) on delete restrict on update restrict;

alter table technique add constraint FK_use foreign key (designID)
      references design (designID) on delete restrict on update restrict;

alter table techniqueInventory add constraint FK_has4 foreign key (techid)
      references technique (techid) on delete restrict on update restrict;

alter table techniquePhase add constraint FK_Reference_68 foreign key (outsourceID)
      references outsource (outsourceID) on delete restrict on update restrict;

alter table user add constraint FK_has6 foreign key (departmentID)
      references department (departmentID) on delete restrict on update restrict;

alter table userRole add constraint FK_userRole foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table userRole add constraint FK_userRole2 foreign key (roleID)
      references role (roleID) on delete restrict on update restrict;

alter table tailor add constraint FK_tailorToDetail foreign key (orderDetailID)
      references orderDetail (orderDetailID) on delete restrict on update restrict;