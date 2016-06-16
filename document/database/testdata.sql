
delete from specificTechnique;

delete from techniqueInventory;

delete from materialInput;

delete from purchaseVendor;

delete from technique;

delete from sampleProcedure;

delete from sampleOrder;

delete from supplementMaterial;

delete from techniquePhase;

delete from tailor;

delete from purchase;

delete from orderMaterialDetail;

delete from orderDetail;

delete from receiveDetail;

delete from outsourceDetail;

delete from QC;

delete from userRole;

delete from supplement;

delete from orders;

delete from receive;

delete from outsource;

delete from materialOutput;

delete from materialApply;

delete from user;

delete from roleAuthority;

delete from designVendor;

delete from BOM;

delete from supply;

delete from store;

delete from sampleStorageDetail;

delete from sample;

delete from abnormalParameter;

delete from module;

delete from department;

delete from authority;

delete from role;

delete from phasesCondition;

delete from modelCondition;

delete from techniqueCondition;

delete from inquiryMaterial;

delete from inquiryDetail;

delete from inquiry;

delete from production;

delete from customer;

delete from processor;

delete from design;

delete from vendor;

delete from material;

delete from warehouse;

insert into warehouse (warehouseid, location, maxCapacity) values (16, '江苏省南京市鼓楼区', 1);

insert into warehouse (warehouseid, location, maxCapacity) values (9, '江苏省南京市栖霞区', 17);

insert into warehouse (warehouseid, location, maxCapacity) values (1, '江苏省苏州市姑苏区', 5);

insert into warehouse (warehouseid, location, maxCapacity) values (5, '江苏省苏州市高新区', 9);

insert into warehouse (warehouseid, location, maxCapacity) values (11, '北京市朝阳区', 18);

insert into warehouse (warehouseid, location, maxCapacity) values (4, '江苏南京市玄武区', 8);

insert into warehouse (warehouseid, location, maxCapacity) values (10, '江苏省南京市江宁区', 7);

insert into warehouse (warehouseid, location, maxCapacity) values (8, '江苏省南京市浦口区', 2);

insert into warehouse (warehouseid, location, maxCapacity) values (15, '江苏省苏州市虎丘区', 16);

insert into warehouse (warehouseid, location, maxCapacity) values (7, '江苏省苏州市吴中县', 15);

insert into warehouse (warehouseid, location, maxCapacity) values (19, '安徽省合肥市蜀山区', 14);

insert into warehouse (warehouseid, location, maxCapacity) values (13, 'LocationEXA01', 11);

insert into warehouse (warehouseid, location, maxCapacity) values (17, 'LocationEXA02', 3);

insert into warehouse (warehouseid, location, maxCapacity) values (6, 'LocationEXA03', 19);

insert into warehouse (warehouseid, location, maxCapacity) values (18, 'LocationEXA04', 13);

insert into warehouse (warehouseid, location, maxCapacity) values (14, 'LocationEXA05', 12);

insert into warehouse (warehouseid, location, maxCapacity) values (12, 'LocationEXA06', 4);

insert into warehouse (warehouseid, location, maxCapacity) values (2, 'LocationEXA07', 0);

insert into warehouse (warehouseid, location, maxCapacity) values (0, 'LocationEXA08', 10);

insert into warehouse (warehouseid, location, maxCapacity) values (3, 'LocationEXA09', 6);

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A001', '棉布001', 'RGB001', '1#红', '100%聚酯纤维', 15, '米', 14, 1, '2016-4-6', '辅料', 'A');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A002', '棉布002', 'RGB002', '2#红', '100%聚酯纤维', 16, '米', 2, 11, '2016-6-19', '辅料', 'A');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A003', '棉布003', 'RGB003', '3#红', '100%聚酯纤维', 8, '米', 5, 19, '2016-10-31', '辅料', 'A');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A004', '棉布004', 'RGB004', '4#红', '100%聚酯纤维', 13, '米', 11, 13, '2016-4-5', '辅料', 'A');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A005', '棉布005', 'RGB005', '5#红', '100%聚酯纤维', 17, '米', 16, 5, '2016-6-20', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A006', '棉布006', 'RGB006', '6#红', '100%聚酯纤维', 4, '米', 8, 12, '2016-2-13', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A007', '棉布007', 'RGB007', '7#红', '100%聚酯纤维', 18, '米', 1, 15, '2016-5-17', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A008', '棉布008', 'RGB008', '8#红', '100%聚酯纤维', 5, '米', 19, 2, '2016-10-20', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A009', '棉布009', 'RGB009', '9#红', '100%聚酯纤维', 10, '米', 7, 14, '2016-9-13', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('A010', '棉布010', 'RGB010', '0#红', '100%聚酯纤维', 11, '米', 9, 17, '2016-4-15', '辅料', 'B');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B001', '贡缎001', 'RGB011', '1#蓝', '100%粘纤', 6, '米', 6, 3, '2016-8-5', '面料', '里料');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B002', '贡缎002', 'RGB012', '2#蓝', '100%粘纤', 1, '米', 18, 7, '2016-8-26', '面料', '里料');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B003', '贡缎003', 'RGB013', '3#蓝', '100%粘纤', 7, '米', 12, 18, '2016-5-25', '面料', '里料');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B004', '贡缎004', 'RGB014', '4#蓝', '100%粘纤', 2, '米', 13, 10, '2016-1-18', '面料', '里料');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B005', '贡缎005', 'RGB015', '5#蓝', '100%粘纤', 14, '米', 3, 16, '2016-9-21', '面料', '里料');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B006', '贡缎006', 'RGB016', '6#蓝', '100%粘纤', 3, '米', 15, 8, '2016-4-8', '面料', '其他');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B007', '贡缎007', 'RGB017', '7#蓝', '100%粘纤', 19, '米', 17, 4, '2016-6-9', '面料', '其他');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B008', '贡缎008', 'RGB018', '8#蓝', '100%粘纤', 12, '米', 4, 9, '2016-1-1', '面料', '其他');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B009', '贡缎009', 'RGB019', '9#蓝', '100%粘纤', 1, '米', 3, 1, '2016-2-7', '面料', '其他');

insert into material (materialCode, materialName, colorCode, colorDescription, materialIngredient, unitPrice, unit, width, outputVol, modificationDate, materialType, shellAccessoryType) values ('B010', '贡缎010', 'RGB020', '0#蓝', '100%粘纤', 9, '米', 10, 6, '2016-4-18', '面料', '其他');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (1, '广本', '111111', '111111X', '中大长江纺织城', '新进供应商', '中大');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (4, '广才', '444444', '444444X', '中大长江纺织城', '优质供应商', '中大');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (17, '广堆', '444444', '444444X', '中大长江纺织城', '新进供应商', '中大');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (3, '广亚', '333333', '333333X', '中大长江纺织城', '优质供应商', '中大');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (19, '广分', '191919', '191919X', '中大长江纺织城', '新进供应商', '中大');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (16, '广发', '161616', '161616X', '河桥纺织城', '优质供应商', '柯桥');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (12, '广风', '121212', '121212X', '河桥纺织城', '劣质供应商', '柯桥');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (5, '广高 ', '555555', '555555X', '河桥纺织城', '新进供应商', '柯桥');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (9, '广华', '999999', '999999X', '河桥纺织城', '优质供应商', '柯桥');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (11, '广佳', '111111E', '111111EX', '河桥纺织城', '优质供应商', '柯桥');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (6, '广开', '666666', '666666X', '义乌纺织城', '新进供应商', '义乌');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (14, '广力', '141414', '141414X', '义乌纺织城', '优质供应商', '义乌');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (15, '广慕', '151515', '151515X', '义乌纺织城', '新进供应商', '义乌');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (0, ' 广宁', '000000', '000000X', '义乌纺织城', '新进供应商', '义乌');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (18, '广品', '181818', '181818X', '义乌纺织城', '优质供应商', '义乌');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (13, '鼎琴', '131313', '131313X', '铁岭纺织一厂', '新进供应商', '其他');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (8, '鼎开', '888888', '888888X', '高新开发厂', '优质供应商', '其他');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (2, '鼎力', '222222', '222222X', '江南织造业厂', '优质供应商', '其他');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (7, '鼎慕', '777777', '777777X', '湖北纺织一厂', '新进供应商', '其他');

insert into vendor (vendorId, vendorName, vendorPhoneNum, vendorMobileNum, vendorAddr, vendorRank, vendorArea) values (10, '鼎丰', '101010', '101010X', '丰云纺织厂', '优质供应商', '其他');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (9, '092016040701001', '暴力皮衣', 'www.baidu.com', 17, '工艺->裁剪->外发', '2016-04-07', '红色', '备注', ' 水洗标编号1', '主标编号', '吊牌编号', 'www.baidu.com', '针织衫');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (19, '192016040701002', '貂帽', 'www.baidu.com', 16, '裁剪->外发', '2016-04-07', '白色', '备注', '水洗标编号2', '主标编号', '吊牌编号', 'www.baidu.com', '针织衫');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (14, '142016041301001', '狂野皮草', 'www.baidu.com', 3, '裁剪->工艺->外发', '2016-04-13', '蓝色', '备注', '水洗标编号3', '主标编号', '吊牌编号', 'www.baidu.com', '针织衫');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (15, '152016041501003', '柔和麻布', 'www.baidu.com', 8, '外发', '2016-04-15', '褐色', '备注', '水洗标编号4', '主标编号', '吊牌编号', 'www.baidu.com', '针织衫');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (5, '052016042301004', '柔和丝绸', 'www.baidu.com', 14, '裁剪->外发', '2016-04-23', '黑色', '备注', '水洗标编号6', '主标编号', '吊牌编号', 'www.baidu.com ', '牛仔裤');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (7, '072016040801002', '柔和皮草', 'www.baidu.com', 0, '裁剪->外发', '2016-04-08', '黑色', '备注', '水洗标编号5', '主标编号', '吊牌编号', 'www.baidu.com', '牛仔裤');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (10, '102016040701001', '柔和皮衣', 'www.baidu.com', 6, '裁剪->外发', '2016-04-07', '白色', '备注', '水洗标编号7', '主标编号', '吊牌编号', 'www.baidu.com', '牛仔裤');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (11, '112016040701002', '布衣', 'www.baidu.com', 4, '裁剪->外发', '2016-04-07', '黑色', '备注 ', '水洗标编号8', '主标编号', '吊牌编号', ' www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (17, '172016040701004', '草帽', 'www.baidu.com', 5, '裁剪->工艺->外发', '2016-04-07', '白色', '备注 ', '水洗标编号9', '主标编号', '吊牌编号', 'www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (16, '162016040701001', '法师袍', 'www.baidu.com', 10, '裁剪->工艺->外发', '2016-04-07', '白色', '备注', '水洗标编号10', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (0, '002016040701003', '铠甲', 'www.baidu.com', 12, '裁剪->工艺->外发', '2016-04-07', '红色', '备注', '水洗标编号11', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (18, '182016040701004', '盔甲', 'www.baidu.com', 15, '裁剪->工艺->外发', '2016-04-07', '黑色', '备注 备注', '水洗标编号12', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (12, '122016040701002', '胫甲', 'www.baidu.com', 11, '工艺->裁剪->外发', '2016-04-07', '黑色', '备注 ', '水洗标编号13', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (4, '042016040701002', '护手', 'www.baidu.com', 9, '工艺->裁剪->外发 ', '2016-04-07', '红色', '备注', '水洗标编号15', '主标编号', '吊牌编号', 'www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (6, '06016040701003', '坎肩', 'www.baidu.com', 7, '工艺->裁剪->外发', '2016-04-07', '黑色', '备注 ', '水洗标编号14', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (3, '032016040701002', '护胸', 'www.baidu.com', 19, '裁剪->外发', '2016-04-07', '白色', '备注 备注', '水洗标编号16', '主标编号', '吊牌编号', ' www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (8, '082016040701001', '戒指', 'www.baidu.com F', 18, '工艺->裁剪->外发', '2016-04-07', '黑色', '备注', ' 水洗标编号17', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (2, '022016040701004', '鞋子', 'www.baidu.com', 13, '工艺->裁剪->外发', '2016-04-07', '红色', '备注', '水洗标编号18', '主标编号', '吊牌编号', 'www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (13, '132016040701001', '武器', 'www.baidu.com', 1, '工艺->裁剪->外发', '2016-04-07', '黑色', '备注', '水洗标编号19 ', '主标编号', '吊牌编号', 'www.baidu.com ', '皮衣');

insert into design (designID, designCode, designName, designPicURL, designProcessPrice, designTechProcedure, designPutawayDate, designColorDescription, designComment, designsewninCode, designMainLabelCode, designHangTagCode, designFlagShipURL, designType) values (1, '012016040701001', '护肩', 'www.baidu.com', 2, '裁剪->工艺->外发', '2016-04-07', '蓝色', '备注', '水洗标编号20', '主标编号', '吊牌编号', 'www.baidu.com', '皮衣');

/*==============================================================*/
/* Insert: processor                                            */
/*==============================================================*/

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor01', 'process001', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '鼓楼区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor02', 'process002', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '栖霞区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor03', 'process003', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '秦淮区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor04', 'process004', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '玄武区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor05', 'process005', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '浦口区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor06', 'process006', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '鼓楼区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor07', 'process007', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '栖霞区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor08', 'process008', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '秦淮区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor09', 'process009', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '玄武区', 

'送货', '2016-3-20', 'beizhu');

insert into processor (processorCode, processorName, processorState, processorInitialPassword, processorMobileNum, processorRank, processorAddr, processorWorkerNum, 

processorDistrict, deliveryType, startingDate, processorComment) values ('processor10', 'process010', ' 启用', '123456', '15950897434', '  A', '南京市', 100, '浦口区', 

'送货', '2016-3-20', 'beizhu');
insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (18, '孙家广', '清风', '线下品牌', '15950572890', '262533678@qq.com', '未通过', 'A');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (12, '周立柱', '奇正', '线下品牌', '15950572891', '123533678@qq.com', '已通过', 'B');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (7, '王成山', '阿迪达斯', '线下品牌', '15950572892', '262543678@163.com', '已通过', 'C');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (19, '王山', '耐克', '线下品牌', '15950572893', '262533654@qq.com', '已通过', 'D');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (14, '冯少荣', '乔丹', '线下品牌', '15950572894', '262333228@qq.com', '已通过', 'E');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (8, '冯全', '苹果', '线下品牌', '15950572895', '262533678@qq.com', '未通过', 'F');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (13, '刘乐', '心相印', '线下品牌', '15950572896', '262532178@qq.com', '未通过', 'G');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (6, '刘腾', '淘宝', '线下品牌', '15950572897', '27653678@qq.com', '已通过', 'H');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (5, '吉跟', '雀巢', '线下品牌', '15950572898', '26257648@163.com', '未通过', 'I');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (1, '孙吉贵', '李宁', '线下品牌', '159505728909', '26256428@qq.com', '未通过', 'J');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (3, '何晨', '贵人鸟', '线下品牌', '15950572840', '26252228@qq.com', '未通过', 'K');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (0, '吴百风', '百度', '线上品牌', '15950572590', '262576478@163.com', '未通过', 'L');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (15, '李彤', '360', '线上品牌', '15954572890', '262533378@qq.com', '未通过', 'M');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (9, '陈春', '饿了么', '线上品牌', '15950542890', '26253333678@qq.com', '未通过', 'N');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (2, '曹操', '美团', '线上品牌', '15950572990', '262443678@qq.com', '未通过', 'O');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (17, '陈道', 'QQ', '线上品牌', '15940572890', '262555578@qq.com', '未通过', 'P');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (11, '周波生', '亿利达', '线上品牌', '13950572890', '262533678@163.com', '未通过', 'Q');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (16, '东方', '哥伦比亚', '线上品牌', '15950572830', '262533338@163.com', '未通过', 'R');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (10, '葛根粉', '三和', '线上品牌', '15930572890', '262876678@qq.com', '未通过', 'S');

insert into customer (customerID, customerContactName, customerBrandName, customerType, customerPhone, customerEMail, customerState, customerAddress) values (4, '季节', '红帽', '线下品牌', '15930572890', '262575378@qq.com', '未通过', 'T');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pFinishQCTime, pProcessTime) values (1, 'SCD1234_160527', '未排单', '质检完成', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pFinishQCTime, pProcessTime) values (4, 'SCD1235_160527', '未排单', '质检完成', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pFinishQCTime, pProcessTime) values (8, 'SCD1236_160527', '裁剪', '质检完成', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pFinishQCTime, pProcessTime) values (12, 'SCD1237_160629', '未排单', '质检完成', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pFinishQCTime, pProcessTime) values (9, 'SCD1238_160420', '裁剪', '质检完成', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pProcessTime) values (7, 'SCD1239_160324', '外发', '质检中', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pProcessTime) values (16, 'SCD1240_160217', '裁剪', '质检中', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pProcessTime) values (15, 'SCD1241_160127', '未排单', '质检中', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pProcessTime) values (10, 'SCD1242_160321', '外发', '质检中', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pQCTime, pProcessTime) values (14, 'SCD1243_160430', '外发', '质检中', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pProcessTime) values (2, 'SCD1244_160828', '未排单', '完整收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pProcessTime) values (17, 'SCD1245_160929', '外发', '完整收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pProcessTime) values (13, 'SCD1246_160111', '未排单', '完整收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pProcessTime) values (6, 'SCD1247_160222', '工艺', '完整收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pReceiveTime, pProcessTime) values (3, 'SCD1248_161011', '未排单', '完整收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pProcessTime) values (19, 'SCD1249_160527', '未排单', '部分收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pProcessTime) values (18, 'SCD1250_161221', '未排单', '部分收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pProcessTime) values (11, 'SCD1251_160616', '未排单', '部分收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pPartReceiveTime, pProcessTime) values (5, 'SCD1252_160207', '未排单', '部分收货', '1980-08-08 8:08:08', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pOutsourceTime, pProcessTime) values (20, 'SCD1253_160401', '外发', '外发加工中', '1980-08-08 8:08:08', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress, pProcessTime) values (21, 'SCD1254_161201', '未排单', '裁剪/工艺阶段', '1980-08-08 8:08:08');

insert into production (productionID, productionCode, productionState, productionProgress) values (22, 'SCD1255_160101', '未排单', '采购中');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime, processOKTime) values (9, 11, 'XJ2015081324144823312', '来样报价', 2, 14, 7, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53', '2016-05-13 13:45:19');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime, processOKTime) values (19, 13, 'XJ2015081387654236431', '来样报价', 18, 17, 6, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53', '2016-05-13 13:45:19');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime, processOKTime) values (10, 18, 'XJ2015081394234745618', '来样报价', 19, 4, 11, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53', '2016-05-13 13:45:19');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime, processOKTime) values (6, 15, 'XJ015081364526546975', '来样报价', 12, 10, 10, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53', '2016-05-13 13:45:19');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime, processOKTime) values (0, 11, 'XJ201508134239480934', '来样报价', 16, 3, 13, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53', '2016-05-13 13:45:19');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime) values (2, 17, 'XJ2015081306612554500', '来样报价', 1, 6, 8, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime) values (13, 6, 'XJ2015081311111111111', '来样报价', 13, 5, 4, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime) values (7, 9, 'XJ2015081322222222222', '来样报价', 4, 18, 16, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime) values (8, 3, 'XJ2015081333333333333', '来样报价', 17, 9, 19, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime, modelOKTime) values (11, 15, 'XJ2015081344444444444', '来样报价', 10, 7, 18, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11', '2016-05-12 14:23:53');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime) values (16, 13, 'XJ2016051755555555555', '来样报价', 7, 8, 3, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime) values (1, 10, 'XJ2016051755585363555', '来样报价', 15, 13, 1, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime) values (17, 13, 'XJ2016051766666666666', '来样报价', 14, 2, 15, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime) values (4, 9, 'XJ2016051777777777777', '来样报价', 3, 1, 2, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime, flowerOKTime) values (12, 7, 'XJ2016051788888888888', '来样报价', 11, 19, 0, '2016-05-09 10:24:32', '2016-05-10 09:09:00', '2016-05-11 11:32:11');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime) values (3, 10, 'XJ016051799999999999', '来样报价', 5, 15, 14, '2016-05-09 10:24:32', '2016-05-10 09:09:00');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime) values (14, 16, 'XJ2016051700000000000', '来样报价', 6, 11, 9, '2016-05-09 10:24:32', '2016-05-10 09:09:00');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime) values (18, 5, 'XJ2016051761543098891', '来样报价', 0, 16, 12, '2016-05-09 10:24:32', '2016-05-10 09:09:00');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime) values (15, 7, 'XJ_2016051700154222222', '来样报价', 9, 0, 5, '2016-05-09 10:24:32', '2016-05-10 09:09:00');

insert into inquiry (inquiryID, designID, inquiryCode, inquiryMaterialSample, inquiryTotal, inquiryProcessCycle, inquiryUnitPrice, shellOKTime, accOKTime) values (5, 6, 'XJ_2016051745454554451', '来样报价', 8, 12, 17, '2016-05-09 10:24:32', '2016-05-10 09:09:00');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (13, 1, 10, 17, 7, 4, 13, 17, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (3, 2, 19, 11, 17, 6, 0, 5, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (4, 3, 11, 4, 8, 18, 12, 14, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (2, 4, 6, 19, 15, 0, 19, 12, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (18, 5, 16, 8, 14, 5, 6, 0, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (6, 6, 13, 5, 3, 12, 5, 7, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (14, 7, 14, 3, 16, 14, 8, 2, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (10, 8, 12, 6, 4, 8, 3, 3, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (5, 9, 15, 14, 5, 9, 11, 4, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (7, 10, 0, 7, 12, 11, 15, 8, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (19, 11, 8, 2, 13, 3, 10, 10, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (16, 12, 17, 13, 11, 2, 17, 11, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (9, 13, 2, 15, 18, 15, 16, 13, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (0, 14, 9, 16, 9, 7, 18, 1, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (8, 15, 3, 0, 10, 13, 2, 9, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (1, 16, 7, 1, 19, 17, 9, 6, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (15, 17, 4, 9, 0, 10, 4, 16, '面料好', '辅料巧');

insert into inquiryDetail (inquiryDetailID, inquiryID, inquiryPrintCost, inquiryTime, inquirySampleCost, inquiryProcessCost, inquiryDetailCycle, inquirySampleCycle, inquiryShellComment, inquiryAccComment) values (17, 18, 5, 18, 6, 1, 1, 19, '面料好', '辅料巧');

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (1, 16, 'B006', 11);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (5, 8, 'B002', 14);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (9, 16, 'A010', 3);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (8, 6, 'B001', 19);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (7, 4, 'B002', 8);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (16, 1, 'A007', 10);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (11, 19, 'B009', 2);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (14, 17, 'B007', 15);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (6, 6, 'B008', 7);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (13, 12, 'B002', 16);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (2, 17, 'B005', 5);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (10, 17, 'A008', 13);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (0, 3, 'B005', 6);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (15, 2, 'A008', 17);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (12, 9, 'A001', 1);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (4, 1, 'B009', 18);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (19, 16, 'A006', 0);

insert into inquiryMaterial (inquiryMaterialID, inquiryID, materialCode, inquiryMaterialUnitVol) values (3, 4, 'B009', 4);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (11, '2016-4-5', 16);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (8, '2016-4-6', 5);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (5, '2016-4-11', 1);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (17, '2016-1-27', 0);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (14, '2015-7-13', 2);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (10, '2015-7-18', 15);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (4, '2015-8-13', 19);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (12, '2015-7-2', 17);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (2, '2016-5-1', 3);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (18, '2016-5-2', 14);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (0, '2015-6-11', 11);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (9, '2015-11-7', 9);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (13, '2016-4-13', 7);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (7, '2016-4-15', 6);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (16, '2016-4-16', 8);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (15, '2015-6-16', 18);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (1, '2015-12-7', 13);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (3, '2015-12-29', 10);

insert into techniqueCondition (techConditionID, techConditionDate, techConditionVol) values (6, '2015-2-23', 12);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (7, '2016-1-12', 8);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (1, '2015-7-7', 15);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (4, '2016-2-17', 9);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (2, '2016-4-2', 17);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (17, '2015-11-8', 13);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (10, '2015-11-16', 4);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (12, '2015-4-6', 6);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (6, '2015-8-14', 0);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (19, '2016-1-1', 1);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (3, '2016-4-9', 5);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (13, '2016-1-5', 16);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (8, '2016-4-15', 2);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (5, '2016-1-9', 12);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (9, '2015-10-28', 19);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (16, '2015-6-1', 10);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (18, '2015-6-6', 14);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (15, '2016-5-3', 18);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (14, '2015-7-21', 7);

insert into modelCondition (modelConditionID, modelConditionDate, modelConditionVol) values (11, '2015-5-1', 11);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (8, '计划采购——电话订购', '2014-4-28', 8);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (10, '计划采购——电话订购', '2016-4-26', 1);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (1, '计划采购——电话订购', '2016-4-18', 10);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (18, '计划采购——电话订购', '2016-1-17', 9);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (19, '计划采购——电话订购', '2016-1-1', 13);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (12, '电话订购——传码单', '2016-4-19', 14);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (4, '电话订购——传码单', '2016-2-21', 4);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (5, '电话订购——传码单', '2016-4-26', 6);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (6, '电话订购——传码单', '2015-8-17', 3);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (11, '传码单——财务付款', '2016-3-10', 18);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (7, '传码单——财务付款', '2015-8-12', 0);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (13, '传码单——财务付款', '2016-3-20', 2);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (16, '财务付款——核对面料', '2016-4-8', 19);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (17, '财务付款——核对面料', '2016-1-19', 17);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (2, '面料齐备——裁剪/工艺', '2015-6-18', 7);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (3, '面料齐备——裁剪/工艺', '2015-5-24', 16);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (15, '裁剪/工艺——外发', '2016-4-27', 15);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (14, '裁剪/工艺——外发', '2016-4-18', 11);

insert into phasesCondition (phasesConditionID, phaseName, phasesConditionDate, phasesConditionVol) values (9, '裁剪/工艺——外发', '2016-4-1', 12);

insert into role (roleID, roleName, roleDescription) values (1, '物料管理负责人', '物料管理负责人');

insert into role (roleID, roleName, roleDescription) values (2, '入库管理负责人', '入库管理负责人');

insert into role (roleID, roleName, roleDescription) values (3, '出库管理负责人', '出库管理负责人');

insert into role (roleID, roleName, roleDescription) values (4, '加工管理负责人', '加工管理负责人');

insert into role (roleID, roleName, roleDescription) values (5, '排单管理负责人', '排单管理负责人');

insert into role (roleID, roleName, roleDescription) values (6, '采购管理负责人', '采购管理负责人');

insert into role (roleID, roleName, roleDescription) values (7, '工艺管理负责人', '工艺管理负责人');

insert into role (roleID, roleName, roleDescription) values (8, '生产管理负责人', '生产管理负责人');

insert into role (roleID, roleName, roleDescription) values (9, '样衣信息负责人', '样衣信息负责人');

insert into role (roleID, roleName, roleDescription) values (10, '补料单负责人', '补料单负责人');

insert into role (roleID, roleName, roleDescription) values (11, 'QC质检单负责人', 'QC质检单负责人');

insert into role (roleID, roleName, roleDescription) values (12, 'NEW询价单管理负责人', 'NEW询价单管理负责人');

insert into role (roleID, roleName, roleDescription) values (13, 'NEW客户订单管理负责人', 'NEW客户订单管理负责人');

insert into role (roleID, roleName, roleDescription) values (14, '图形报表负责人', '图形报表负责人');

insert into role (roleID, roleName, roleDescription) values (15, '客户管理负责人', '客户管理负责人');

insert into role (roleID, roleName, roleDescription) values (16, '系统管理员', '系统管理员');

insert into role (roleID, roleName, roleDescription) values (17, '款式与订单负责人', '款式与订单负责人');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料新增', '保存', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料新增', '录入销售明细查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料查询', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料查询', '新增', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料查询', '单价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料查询', '面辅料查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料预订', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料预订', '面辅料预订查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '物料预订查询', '面辅料预订查询', 'WO9PLNYMGWM6A7DVXMUH');	

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '供应商管理', '确定', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '供应商管理', '厂商管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '新增', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '添加', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '删除', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '绑定物料', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '上传图片', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', '款式新增', '导入销售明细查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '新增', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '款式锁定', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '修改上传图片', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('物料管理', 'BOM管理', '详细', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('入库管理', '入库', '确认入仓', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('入库管理', '入库', '面辅料入库', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('入库管理', '入库单管理', '入库单管理', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '出库', '修改出仓数', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '出库', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '出库', '出库单详情查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '出库单管理', '出库单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '暂无', '销售提成明细查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('出库管理', '暂无', '销售成员列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '【new】毛衣加工单管理', '毛衣加工单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '加工方管理', '确定', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '加工方管理', '收货', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '加工方管理', '加工方管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '收货单管理', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '收货单管理', '废弃', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '收货单管理', '收货单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '新增外发单', '确定', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '新增外发单', '打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '新增外发单', '新增外发单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '外发单管理', '打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '外发单管理', '收货', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '外发单管理', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '外发单管理', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('加工管理', '外发单管理', '外发单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货裁剪排单', '查看外发单详情', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货裁剪排单', '大货裁剪排单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货工艺排单', '查看外发单详情', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货工艺排单', '大货工艺排单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货外发排单', '查看外发单详情', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货外发排单', '大货外发排单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '暂无', '确定', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '暂无', '新建排单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '库存审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '用料审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '电话订购', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '传码单', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '财务对账', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '批量电话订购', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '核对面料', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '添加', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '删除', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '待核对面料打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '小红旗', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '条码打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '面料采购单管理', '采购单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '物料采购单管理', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('采购单管理', '毛衣采购单管理', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺单管理', '工艺单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺管理', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺管理', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺管理', '样衣信息', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺管理', '打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '工艺管理', '工艺单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '款式资料列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', 'excel导入', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '删除', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '原图资料下载	', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '实拍图资料下载', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '新增', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '暂无', '工艺单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '新增生产单', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '新增生产单', '状态调整', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '新增生产单', '新增生产单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '生产单修改', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '生产单删除', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '未排单', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '待审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '已排单', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '可采购辅料', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '生产单打印', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '小红旗', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '状态调整', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '生产单列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '生产单列表', '待采购', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '异常积压订单追踪', '异常积压订单追踪查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('生产单管理', '裁剪单订单预警', '裁剪单管理', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('样衣信息', '样衣入库', '样衣新增查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('样衣信息', '样衣管理', '样衣管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '面料补料单', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '面料补料单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '辅料补料单', '提交', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '面料补料单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '物料补料单', '操作状态', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '物料补料单', '查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '物料补料单', '审核状态', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '物料补料单', '查询详细信息', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('补料单', '物料补料单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '新增质检单', '新增质检单查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '质检单列表', '指派', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '质检单列表', '质检单列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '面料报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '辅料报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '花型报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '版型报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '加工报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '申请修改报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单列表', '询价单列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '指派', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '审核修改报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '确认报价', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '客户订单管理列表', '客户订单管理列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '样衣指派', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '已指派', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '确认样衣', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '放码', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '制作样衣', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '审版', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户订单管理', '样衣单管理', '样衣单管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('图形报表', '每日工艺单积压趋势图', '每日工艺单积压趋势图查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('图形报表', '每日制版单积压趋势图', '每日制版单积压趋势图查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('图形报表', '环节订单数积压趋势图', '环节订单数积压趋势图查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户管理', '客户管理列表', '审核', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户管理', '客户管理列表', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('客户管理', '客户管理列表', '客户管理列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '权限设置', '权限设置查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '角色分配', '角色新增', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '角色分配', '角色查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '用户管理', '用户管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '日志管理', '日志管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '模组资料', '模组资料查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '组织管理', '组织管理查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '系统异常参数设置', '系统异常参数查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('系统管理', '返点参数设定', '参数设定查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('工艺管理', '新增款式工艺单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('询价单管理', '询价单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('款式与订单', '新建订单', '款式列表查询', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('款式与订单', '新建订单', '根据款式新建订单', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '开始排单', '暂无', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货工艺排单', '开始和结束工艺阶段', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('排单管理', '大货裁剪排单', '委派裁剪员工', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '质检单列表', '作废', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '质检单列表', '填写质检结果', 'WO9PLNYMGWM6A7DVXMUH');

insert into authority (highAuthName, middleAuthName, lowAuthName, authDescription) values ('QC质检单', '质检单列表', '查看所有环节结果', 'WO9PLNYMGWM6A7DVXMUH');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (1, '财务部', 'Financial Department', '财务部', '432148729', '0CQ5MJJE602N13SMD5CV');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (2, '销售部', 'Sales Department', '销售部', '382698320', 'SNDQ12F8MYCW7QC3PEJ');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (3, '采购部', 'Purchase Department', '采购部', '162389293', 'KI40HHFX4PHV2PLRYORL');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (4, '市场部', 'Marketing Department', '市场部', '434389203', 'KL47J4JW039WM6C2GHA8');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (5, '制版部', 'Platemaking Department', '制版部', '329742637', '69R0OX8U11WE88EJ2');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (6, '质检部', 'Quality Inspection Department', '质检部', '964254345', 'W8RUGUFV0DXWQGHE9KBR');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (7, '生产部', 'Product Department', '生产部', '912365642', 'AT25WDXF312XNS250 5F');

insert into department (departmentID, departmentFullName, departmentEnName, departmentAbbrName, departmentPhone, departmentDescription) values (8, '样衣间', 'Sample Department', '样衣间', '487542998', '0KYDMNQDLJ6C82NO0T46');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (1, '物料新增', '物料管理', '保存', 11, 'zzl', '123456', 0, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (2, '物料新增', '物料管理', '录入销售明细查询', 6, 'zzl', '123456', 15, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (3, '物料查询', '物料管理', '修改', 12, 'zzl', '123456', 3, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (4, '物料查询', '物料管理', '新增', 5, 'zzl', '123456', 2, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (5, '物料查询', '物料管理', '单价', 17, 'zzl', '123456', 18, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (6, '物料查询', '物料管理', '面辅料查询', 13, 'zzl', '123456', 13, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (7, '物料预订', '物料管理', '提交', 15, 'zzl', '123456', 10, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (8, '物料预订', '物料管理', '面辅料预订查询', 0, 'zzl', '123456', 14, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (9, '物料预订查询', '物料管理', '面辅料预订查询', 13, 'zzl', '123456', 13, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (10, '供应商管理', '物料管理', '确定', 8, 'zzl', '123456', 8, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (11, '供应商管理', '物料管理', '厂商管理查询', 10, 'zzl', '123456', 12, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (12, '款式新增', '物料管理', '修改', 2, 'zzl', '123456', 11, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (13, '款式新增', '物料管理', '新增', 19, 'zzl', '123456', 19, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (14, '款式新增', '物料管理', '添加', 7, 'zzl', '123456', 4, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (15, '款式新增', '物料管理', '删除', 3, 'zzl', '123456', 16, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (16, '款式新增', '物料管理', '绑定物料', 4, 'zzl', '123456', 9, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (17, '款式新增', '物料管理', '上传图片', 9, 'zzl', '123456', 17, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (18, '款式新增', '物料管理', '导入销售明细查询', 18, 'zzl', '123456', 5, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (19, 'BOM管理', '物料管理', '修改', 1, 'zzl', '123456', 7, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (20, 'BOM管理', '物料管理', '新增', 14, 'zzl', '123456', 1, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (21, 'BOM管理', '物料管理', '款式锁定', 11, 'zzl', '123456', 0, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (22, 'BOM管理', '物料管理', '作废', 6, 'zzl', '123456', 15, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (23, 'BOM管理', '物料管理', '修改上传图片', 12, 'zzl', '123456', 3, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (24, 'BOM管理', '物料管理', '查询', 5, 'zzl', '123456', 2, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (25, 'BOM管理', '物料管理', '详细', 17, 'zzl', '123456', 18, '物料管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (26, '入库', '入库管理', '确认入仓', 15, 'zzl', '123456', 10, '入库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (27, '入库', '入库管理', '面辅料入库', 0, 'zzl', '123456', 14, '入库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (28, '入库单管理', '入库管理', '入库单管理', 8, 'zzl', '123456', 8, '入库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (29, '出库', '出库管理', '修改出仓数', 10, 'zzl', '123456', 12, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (30, '出库', '出库管理', '提交', 2, 'zzl', '123456', 11, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (31, '出库', '出库管理', ' 出库单详情查询', 19, 'zzl', '123456', 19, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (32, '出库单管理', '出库管理', '出库单管理查询', 7, 'zzl', '123456', 4, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (33, '暂无', '出库管理', '销售提成明细查询', 3, 'zzl', '123456', 16, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (34, '暂无', '出库管理', '销售成员列表查询', 4, 'zzl', '123456', 9, '出库管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (35, '【new】毛衣加工单管理', '加工管理', '毛衣加工单管理查询', 9, 'zzl', '123456', 17, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (36, '加工方管理', '加工管理', '确定', 18, 'zzl ', '123456', 5, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (37, '加工方管理', '加工管理', '收货', 1, 'zzl', '123456', 7, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (38, '加工方管理', '加工管理', '加工方管理查询', 2, 'zzl', '123456', 11, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (39, '收货单管理', '加工管理', '修改', 14, 'zzl', '123456', 1, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (40, '收货单管理', '加工管理', '废弃', 11, 'zzl', '123456', 0, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (41, '收货单管理', '加工管理', '收货单管理查询', 6, 'zzl', '123456', 15, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (42, '新增外发单', '加工管理', '确定', 12, 'zzl', '123456', 3, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (43, '新增外发单', '加工管理', '打印', 5, 'zzl', '123456', 2, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (44, '新增外发单', '加工管理', '新增外发单查询', 17, 'zzl', '123456', 18, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (45, '外发单管理', '加工管理', '打印', 13, 'zzl', '123456', 13, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (46, '外发单管理', '加工管理', '收货', 15, 'zzl', '123456', 10, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (47, '外发单管理', '加工管理', '修改', 0, 'zzl', '123456', 14, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (48, '外发单管理', '加工管理', '作废', 8, 'zzl', '123456', 8, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (49, '外发单管理', '加工管理', '外发单管理查询', 10, 'zzl', '123456', 12, '加工管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (50, '大货裁剪排单', '排单管理', '查看外发单详情', 19, 'zzl', '123456', 19, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (51, '大货裁剪排单', '排单管理', '大货裁剪排单查询', 7, 'zzl', '123456', 4, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (52, '大货工艺排单', '排单管理', '查看外发单详情', 3, 'zzl', '123456', 16, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (53, '大货工艺排单', '排单管理', '大货工艺排单查询', 4, 'zzl', '123456', 9, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (54, '大货外发排单', '排单管理', '查看外发单详情', 9, 'zzl', '123456', 17, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (55, '大货外发排单', '排单管理', '大货外发排单查询', 18, 'zzl', '123456', 5, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (56, '暂无', '排单管理', '确定', 1, 'zzl', '123456', 7, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (57, '暂无', '排单管理', '新建排单查询', 14, 'zzl', '123456', 1, '排单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (58, '面料采购单管理', '采购单管理', '库存审核', 11, 'zzl', '123456', 0, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (59, '面料采购单管理', '采购单管理', '用料审核', 6, 'zzl', '123456', 15, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (60, '面料采购单管理', '采购单管理', '电话订购', 12, 'zzl', '123456', 3, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (61, '面料采购单管理', '采购单管理', '传码单', 5, 'zzl', '123456', 2, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (62, '面料采购单管理', '采购单管理', '财务对账', 17, 'zzl', '123456', 18, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (63, '面料采购单管理', '采购单管理', '批量电话订购', 13, 'zzl', '123456', 13, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (64, '面料采购单管理', '采购单管理', '核对面料', 15, 'zzl', '123456', 10, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (65, '面料采购单管理', '采购单管理', '添加', 0, 'zzl', '123456', 14, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (66, '面料采购单管理', '采购单管理', '删除', 8, 'zzl', '123456', 8, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (67, '面料采购单管理', '采购单管理', '待核对面料打印', 10, 'zzl', '123456', 12, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (68, '面料采购单管理', '采购单管理', '作废', 2, 'zzl', '123456', 11, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (69, '面料采购单管理', '采购单管理', '小红旗', 19, 'zzl', '123456 RRA', 19, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (70, '面料采购单管理', '采购单管理', '条码打印', 7, 'zzl', '123456', 4, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (71, '面料采购单管理', '采购单管理', '审核', 3, 'zzl', '123456', 16, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (72, '面料采购单管理', '采购单管理', '采购单管理查询', 4, 'zzl', '123456', 9, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (73, '物料采购单管理', '采购单管理', '暂无', 9, 'zzl', '123456', 17, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (74, '毛衣采购单管理', '采购单管理', '暂无', 18, 'zzl', '123456', 5, '采购单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (75, '工艺单管理', '工艺管理', '工艺单管理查询', 1, 'zzl', '123456', 7, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (76, '工艺管理', '工艺管理', '提交', 14, 'zzl', '123456', 1, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (77, '工艺管理', '工艺管理', '修改', 11, 'zzl', '123456', 0, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (78, '工艺管理', '工艺管理', '样衣信息', 6, 'zzl', '123456', 15, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (79, '工艺管理', '工艺管理', '打印', 12, 'zzl', '123456', 3, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (80, '工艺管理', '工艺管理', '工艺单查询', 5, 'zzl', '123456', 2, '工艺管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (81, '暂无', '生产单管理', '款式资料列表查询', 17, 'zzl', '123456', 18, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (82, '暂无', '生产单管理', '修改', 13, 'zzl', '123456', 13, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (83, '暂无', '生产单管理', 'excel导入', 15, 'zzl', '123456', 10, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (84, '暂无', '生产单管理', '删除', 0, 'zzl', '123456', 14, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (85, '暂无', '生产单管理', '原图资料下载', 8, 'zzl', '123456', 8, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (86, '暂无', '生产单管理', '实拍图资料下载', 10, 'zzl', '123456', 12, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (87, '暂无', '生产单管理', '新增', 2, 'zzl', '123456', 11, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (88, '暂无', '生产单管理', '工艺单查询', 19, 'zzl', '123456', 19, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (89, '新增生产单', '生产单管理', '提交', 7, 'zzl', '123456', 4, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (90, '新增生产单', '生产单管理', '状态调整', 3, 'zzl', '123456', 16, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (91, '新增生产单', '生产单管理', '新增生产单查询', 4, 'zzl', '123456', 9, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (92, '生产单列表', '生产单管理', '生产单修改', 9, 'zzl', '123456', 17, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (93, '生产单列表', '生产单管理', '生产单删除', 18, 'zzl', '123456', 5, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (94, '生产单列表', '生产单管理', '未排单', 1, 'zzl', '123456', 7, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (95, '生产单列表', '生产单管理', '待审核', 14, 'zzl', ' 123456', 1, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (96, '生产单列表', '生产单管理', '已排单', 11, 'zzl', '123456', 0, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (97, '生产单列表', '生产单管理', '可采购辅料', 6, 'zzl', '123456', 15, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (98, '生产单列表', '生产单管理', '生产单打印', 12, 'zzl', '123456', 3, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (99, '生产单列表', '生产单管理', '小红旗', 5, 'zzl', '123456', 2, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (100, '生产单列表', '生产单管理', '状态调整', 17, 'zzl', '123456', 18, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (101, '生产单列表', '生产单管理', '生产单列表查询', 13, 'zzl', '123456', 13, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (102, '生产单列表', '生产单管理', '待采购', 15, 'zzl', '123456', 10, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (103, '异常积压订单追踪', '生产单管理', '异常积压订单追踪查询', 0, 'zzl', '123456', 14, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (104, '裁剪单订单预警', '生产单管理', '裁剪单管理', 8, 'zzl', '123456', 8, '生产单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (105, '样衣入库', '样衣信息', '样衣新增查询', 10, 'zzl', '123456', 12, '样衣信息');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (106, '样衣管理', '样衣信息', '样衣管理查询', 2, 'zzl', '123456', 11, '样衣信息');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (107, '面料补料单', '补料单', '提交', 19, 'zzl', '123456', 19, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (108, '面料补料单', '补料单', '添加', 7, 'zzl', '123456', 4, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (109, '面料补料单', '补料单', '改变状态', 3, 'zzl', '123456', 16, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (110, '面料补料单', '补料单', '面料补料单查询', 4, 'zzl', '123456', 9, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (111, '辅料补料单', '补料单', '提交', 9, 'zzl', '123456', 17, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (112, '辅料补料单', '补料单', '添加', 18, 'zzl', '123456', 5, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (113, '辅料补料单', '补料单', '改变状态', 1, 'zzl', '123456', 7, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (114, '辅料补料单', '补料单', '辅料补料单查询', 14, 'zzl', '123456', 1, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (115, '物料补料单', '补料单', '暂无', 11, 'zzl', '123456', 0, '补料单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (116, '新增质检单', 'QC质检单', '新增质检单查询', 6, 'zzl', '123456', 15, 'QC质检单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (117, '质检单列表', 'QC质检单', '指派', 12, 'zzl', '123456', 3, 'QC质检单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (118, '质检单列表', 'QC质检单', '质检单列表查询', 5, 'zzl', '123456', 2, 'QC质检单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (119, '询价单列表', '询价单管理', '面料报价', 17, 'zzl', '123456', 18, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (120, '询价单列表', '询价单管理', '辅料报价', 13, 'zzl', '123456', 13, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (121, '询价单列表', '询价单管理', '花型报价', 15, 'zzl', '123456', 10, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (122, '询价单列表', '询价单管理', '版型报价', 0, 'zzl', '123456', 14, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (123, '询价单列表', '询价单管理', '加工报价', 8, 'zzl', '123456', 8, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (124, '询价单列表', '询价单管理', '申请修改报价', 10, 'zzl', '123456', 12, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (125, '询价单列表', '询价单管理', '询价单列表查询', 2, 'zzl', '123456', 11, '询价单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (126, '客户订单管理列表', '客户订单管理', '指派', 19, 'zzl', '123456', 19, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (127, '客户订单管理列表', '客户订单管理', '审核', 7, 'zzl', '123456', 4, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (128, '客户订单管理列表', '客户订单管理', '作废', 3, 'zzl', '123456', 16, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (129, '客户订单管理列表', '客户订单管理', '审核修改报价', 4, 'zzl', '123456', 9, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (130, '客户订单管理列表', '客户订单管理', '确认报价', 9, 'zzl', '123456', 17, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (131, '客户订单管理列表', '客户订单管理', '客户订单管理列表查询', 18, 'zzl', '123456', 5, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (132, '样衣单管理', '客户订单管理', '样衣指派', 1, 'zzl', '123456', 7, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (133, '样衣单管理', '客户订单管理', '已指派', 14, 'zzl', ' 123456', 1, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (134, '样衣单管理', '客户订单管理', '确认样衣', 11, 'zzl', '123456', 0, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (135, '样衣单管理', '客户订单管理', '放码', 6, 'zzl', '123456', 15, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (136, '样衣单管理', '客户订单管理', '制作样衣', 12, 'zzl', '123456', 3, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (137, '样衣单管理', '客户订单管理', '审版', 5, 'zzl', '123456', 2, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (138, '样衣单管理', '客户订单管理', '样衣单管理查询', 17, 'zzl', '123456', 18, '客户订单管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (139, '每日工艺单积压趋势图', '图形报表', '每日工艺单积压趋势图查询', 13, 'zzl', '123456', 13, '图形报表');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (140, '每日制版单积压趋势图', '图形报表', '每日制版单积压趋势图查询', 15, 'zzl', '123456', 10, '图形报表');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (141, '环节订单数积压趋势图', '图形报表', '环节订单数积压趋势图查询', 0, 'zzl', '123456', 14, '图形报表');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (142, '客户管理列表', '客户管理', '审核', 8, 'zzl', '123456', 8, '客户管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (143, '客户管理列表', '客户管理', '作废', 10, 'zzl', '123456', 12, '客户管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (144, '客户管理列表', '客户管理', '客户管理列表查询', 2, 'zzl', '123456', 11, '客户管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (145, '权限设置', '系统管理', '权限设置查询', 19, 'zzl', '123456', 19, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (146, '角色分配', '系统管理', '角色新增', 7, 'zzl', '123456', 4, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (147, '角色分配', '系统管理', '角色查询', 3, 'zzl', '123456', 16, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (148, '用户管理', '系统管理', '用户管理查询', 4, 'zzl', '123456', 9, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (149, '日志管理', '系统管理', '日志管理查询', 9, 'zzl', '123456', 17, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (150, '模组资料', '系统管理', '模组资料查询', 18, 'zzl', '123456', 5, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (151, '组织管理', '系统管理', '组织管理查询', 1, 'zzl', '123456', 7, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (152, '系统异常参数设置', '系统管理', '系统异常参数查询', 14, 'zzl', '123456', 1, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (153, '返点参数设定', '系统管理', '参数设定查询', 11, 'zzl', '123456', 0, '系统管理');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (154, '新增款式工艺单', '工艺管理', '暂无', 6, 'zzl', '123456', 15, '新增款式工艺单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (155, '询价单', '询价单管理', '暂无', 12, 'zzl', '123456', 3, '询价单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (156, '新建订单', '款式与订单', '款式列表查询', 5, 'zzl', '123456', 2, '新建订单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (157, '新建订单', '款式与订单', '根据款式新建订单', 17, 'zzl', '123456', 18, '新建订单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (158, '开始排单', '排单管理', '暂无', 13, 'zzl', '123456', 13, '开始排单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (159, '大货工艺排单', '排单管理', '开始和结束工艺阶段', 15, 'zzl', '123456', 10, '大货工艺排单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (160, '大货裁剪排单', '排单管理', '委派裁剪员工', 0, 'zzl', '123456', 14, '大货裁剪排单');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (161, '质检单列表', 'QC质检单', '作废', 8, 'zzl', '123456', 8, '质检单列表');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (162, '质检单列表', 'QC质检单', '填写质检结果', 10, 'zzl', '123456', 12, '质检单列表');

insert into module (moduleID, middleModuleName, highModuleName, lowModuleName, moduleNum, moduleRoute, moduleOwnCode, moduleEnabled, moduleSpecification) values (163, '质检单列表', 'QC质检单', '查看所有环节结果', 2, 'zzl', '123456', 11, '质检单列表');

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (4, '计划采购——电话订购', 16);

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (5, '电话订购——传码单', 15);

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (17, '传码单——财务付款', 10);

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (8, '财务付款——核对面料', 17);

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (7, '面料齐备——裁剪/工艺', 7);

insert into abnormalParameter (abnormalParameterID, abParaName, abParaValue) values (1, '裁剪/工艺——外发', 11);

insert into sample (sampleID, designID, samplePlace, sampleState) values (5, 16, '第一排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (15, 15, '第四排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (8, 10, '第五排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (7, 12, '第六排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (16, 8, '第七排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (17, 5, '第二排', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (19, 18, '第三列', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (1, 19, '第五列', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (3, 6, '第七列', '外借');

insert into sample (sampleID, designID, samplePlace, sampleState) values (14, 2, '货架最底层', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (9, 8, '货架最高层', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (18, 13, '第十列', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (13, 17, '第十排', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (6, 7, '第十一列', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (11, 7, '第十五排', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (10, 13, '第十七排', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (2, 15, '货舱', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (4, 4, '储藏室1001', '在库');

insert into sample (sampleID, designID, samplePlace, sampleState) values (12, 18, '储藏室2002', '在库');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (13, 9, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (4, 14, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (11, 14, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (1, 8, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (6, 9, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (12, 17, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (16, 10, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (10, 13, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (2, 11, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (7, 5, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (9, 19, '无备注', '出库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (14, 10, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (5, 5, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (17, 17, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (19, 16, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (18, 10, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (3, 1, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (8, 10, '无备注', '入库', '1970-08-08 8:08:08');

insert into sampleStorageDetail (sampleStorageDetailID, sampleID, sampleOPComment, sampleOPType, sampleOPTime) values (15, 18, '无备注', '入库', '1970-08-08 8:08:08');

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (16, 'A001', 4, 19);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (9, 'A002', 15, 11);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (1, 'A003', 6, 10);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (5, 'A004', 16, 4);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (11, 'A005', 14, 6);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (4, 'A006', 11, 17);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (10, 'A007', 18, 12);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (8, 'A008', 2, 5);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (15, 'A009', 3, 14);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (7, 'A010', 19, 15);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (19, 'B001', 17, 1);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (13, 'B002', 10, 13);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (17, 'B003', 0, 8);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (6, 'B004', 7, 7);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (18, 'B005', 1, 0);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (14, 'B006', 5, 18);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (12, 'B007', 13, 3);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (2, 'B008', 9, 9);

insert into store (warehouseid, materialCode, remainVol, frozenVol) values (3, 'B010', 8, 16);

insert into supply (supplyID, vendorId, materialCode) values (6, 1, 'B001');

insert into supply (supplyID, vendorId, materialCode) values (13, 4, 'A003');

insert into supply (supplyID, vendorId, materialCode) values (9, 15, 'A004');

insert into supply (supplyID, vendorId, materialCode) values (1, 11, 'B003');

insert into supply (supplyID, vendorId, materialCode) values (4, 18, 'A008');

insert into supply (supplyID, vendorId, materialCode) values (3, 13, 'A001');

insert into supply (supplyID, vendorId, materialCode) values (16, 4, 'A007');

insert into supply (supplyID, vendorId, materialCode) values (14, 15, 'A001');

insert into supply (supplyID, vendorId, materialCode) values (8, 4, 'A002');

insert into supply (supplyID, vendorId, materialCode) values (15, 5, 'A005');

insert into supply (supplyID, vendorId, materialCode) values (7, 7, 'B006');

insert into supply (supplyID, vendorId, materialCode) values (18, 4, 'A003');

insert into supply (supplyID, vendorId, materialCode) values (5, 6, 'A007');

insert into supply (supplyID, vendorId, materialCode) values (12, 11, 'A001');

insert into supply (supplyID, vendorId, materialCode) values (19, 8, 'A001');

insert into supply (supplyID, vendorId, materialCode) values (17, 14, 'A005');

insert into supply (supplyID, vendorId, materialCode) values (11, 13, 'A004');

insert into supply (supplyID, vendorId, materialCode) values (10, 16, 'A006');

insert into supply (supplyID, vendorId, materialCode) values (2, 6, 'B001');

insert into supply (supplyID, vendorId, materialCode) values (20, 1, 'A009');

insert into supply (supplyID, vendorId, materialCode) values (21, 1, 'A010');

insert into supply (supplyID, vendorId, materialCode) values (22, 2, 'B001');

insert into supply (supplyID, vendorId, materialCode) values (23, 1, 'B002');

insert into supply (supplyID, vendorId, materialCode) values (24, 2, 'B002');

insert into supply (supplyID, vendorId, materialCode) values (25, 1, 'B003');

insert into supply (supplyID, vendorId, materialCode) values (26, 1, 'B004');

insert into supply (supplyID, vendorId, materialCode) values (27, 2, 'B004');

insert into supply (supplyID, vendorId, materialCode) values (28, 1, 'B005');

insert into supply (supplyID, vendorId, materialCode) values (29, 2, 'B005');

insert into supply (supplyID, vendorId, materialCode) values (30, 1, 'B006');

insert into supply (supplyID, vendorId, materialCode) values (31, 1, 'B007');

insert into supply (supplyID, vendorId, materialCode) values (32, 2, 'B007');

insert into supply (supplyID, vendorId, materialCode) values (33, 1, 'B008');

insert into supply (supplyID, vendorId, materialCode) values (34, 2, 'B008');

insert into supply (supplyID, vendorId, materialCode) values (35, 1, 'B009');

insert into supply (supplyID, vendorId, materialCode) values (36, 2, 'B009');

insert into supply (supplyID, vendorId, materialCode) values (37, 1, 'B010');

insert into supply (supplyID, vendorId, materialCode) values (38, 2, 'B010');


insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A001', 9, 1.2, '大身');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A002', 19, 1.2, '大身');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A003', 14, 1.2, '大身');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A004', 15, 1.2, '大身');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A005', 5, 1.2, '大身');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A006', 7, 1.2, '里布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A007', 10, 1.2, '里布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A008', 11, 1.2, '里布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A009', 17, 1.2, '里布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('A010', 16, 1.2, '里布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B002', 18, 1.2, '配料');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B003', 12, 1.2, '配料');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B004', 4, 1.2, '配料');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B005', 6, 1.2, '配料');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B006', 3, 1.2, '别布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B007', 8, 1.2, '别布');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B008', 2, 1.2, '花边');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B009', 13, 1.2, '蕾丝');

insert into BOM (materialCode, designID, volPerDesign, materialPosition) values ('B010', 1, 1.2, '其他');

insert into designVendor (vendorId, designID) values (1, 9);

insert into designVendor (vendorId, designID) values (4, 19);

insert into designVendor (vendorId, designID) values (17, 14);

insert into designVendor (vendorId, designID) values (3, 15);

insert into designVendor (vendorId, designID) values (19, 5);

insert into designVendor (vendorId, designID) values (16, 7);

insert into designVendor (vendorId, designID) values (12, 10);

insert into designVendor (vendorId, designID) values (5, 11);

insert into designVendor (vendorId, designID) values (9, 17);

insert into designVendor (vendorId, designID) values (11, 16);

insert into designVendor (vendorId, designID) values (14, 18);

insert into designVendor (vendorId, designID) values (15, 12);

insert into designVendor (vendorId, designID) values (18, 6);

insert into designVendor (vendorId, designID) values (13, 3);

insert into designVendor (vendorId, designID) values (8, 8);

insert into designVendor (vendorId, designID) values (2, 2);

insert into designVendor (vendorId, designID) values (7, 13);

insert into designVendor (vendorId, designID) values (10, 1);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (1, 1, 1);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (2, 1, 2);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (3, 1, 3);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (4, 1, 4);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (5, 1, 5);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (6, 1, 6);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (7, 1, 7);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (8, 1, 8);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (9, 1, 9);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (10, 1, 10);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (11, 1, 11);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (12, 1, 12);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (13, 1, 13);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (14, 1, 14);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (15, 1, 15);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (16, 1, 16);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (17, 1, 17);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (18, 1, 18);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (19, 1, 19);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (20, 1, 20);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (21, 1, 21);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (22, 1, 22);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (23, 1, 23);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (24, 1, 24);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (25, 1, 25);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (26, 2, 26);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (27, 2, 27);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (28, 2, 28);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (29, 3, 29);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (30, 3, 30);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (31, 3, 31);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (32, 3, 32);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (33, 3, 33);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (34, 3, 34);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (35, 4, 35);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (36, 4, 36);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (37, 4, 37);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (38, 4, 38);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (39, 4, 39);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (40, 4, 40);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (41, 4, 41);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (42, 4, 42);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (43, 4, 43);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (44, 4, 44);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (45, 4, 45);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (46, 4, 46);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (47, 4, 47);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (48, 4, 48);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (49, 4, 49);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (50, 5, 50);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (51, 5, 51);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (52, 5, 52);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (53, 5, 53);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (54, 5, 54);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (55, 5, 55);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (56, 5, 56);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (57, 5, 57);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (58, 6, 58);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (59, 6, 59);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (60, 6, 60);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (61, 6, 61);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (62, 6, 62);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (63, 6, 63);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (64, 6, 64);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (65, 6, 65);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (66, 6, 66);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (67, 6, 67);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (68, 6, 68);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (69, 6, 69);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (70, 6, 70);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (71, 6, 71);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (72, 6, 72);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (73, 6, 73);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (74, 6, 74);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (75, 7, 75);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (76, 7, 76);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (77, 7, 77);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (78, 7, 78);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (79, 7, 79);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (80, 7, 80);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (81, 8, 81);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (82, 8, 82);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (83, 8, 83);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (84, 8, 84);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (85, 8, 85);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (86, 8, 86);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (87, 8, 87);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (88, 8, 88);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (89, 8, 89);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (90, 8, 90);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (91, 8, 91);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (92, 8, 92);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (93, 8, 93);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (94, 8, 94);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (95, 8, 95);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (96, 8, 96);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (97, 8, 97);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (98, 8, 98);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (99, 8, 99);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (100, 8, 100);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (101, 8, 101);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (102, 8, 102);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (103, 8, 103);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (104, 8, 104);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (105, 9, 105);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (106, 9, 106);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (107, 10, 107);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (108, 10, 108);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (109, 10, 109);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (110, 10, 110);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (111, 10, 111);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (112, 10, 112);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (113, 10, 113);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (114, 10, 114);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (115, 10, 115);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (116, 11, 116);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (117, 11, 117);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (118, 11, 118);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (119, 12, 119);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (120, 12, 120);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (121, 12, 121);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (122, 12, 122);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (123, 12, 123);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (124, 12, 124);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (125, 12, 125);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (126, 13, 126);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (127, 13, 127);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (128, 13, 128);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (129, 13, 129);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (130, 13, 130);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (131, 13, 131);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (132, 13, 132);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (133, 13, 133);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (134, 13, 134);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (135, 13, 135);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (136, 13, 136);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (137, 13, 137);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (138, 13, 138);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (139, 14, 139);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (140, 14, 140);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (141, 14, 141);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (142, 15, 142);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (143, 15, 143);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (144, 15, 144);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (145, 16, 145);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (146, 16, 146);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (147, 16, 147);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (148, 16, 148);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (149, 16, 149);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (150, 16, 150);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (151, 16, 151);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (152, 16, 152);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (153, 16, 153);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (154, 7, 154);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (155, 12, 155);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (156, 17, 156);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (157, 17, 157);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (158, 5, 158);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (159, 5, 159);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (160, 5, 160);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (161, 11, 161);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (162, 11, 162);

insert into roleAuthority (roleAuthID, roleID, authorityID) values (163, 11, 163);

insert into roleAuthority (roleId, authorityID) values (16,156);

insert into roleAuthority (roleId, authorityID) values (16,118);

insert into roleAuthority (roleId, authorityID) values (16,163);

delete from roleAuthority where roleID=11 and authorityID=163;


insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (1, 8, 'Messi', '梅西', '123456', '巴塞罗那', '123456789', 'messi@gmail.com', 'messi', '巴萨', '球王');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (2, 1, 'Ronaldo', 'C罗', '123456', '马德里', '123456789', 'ronaldo@gmail.com', 'ronaldo', '皇马', '三票');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (3, 7, 'Rooney', '鲁尼', '123456', '曼彻斯特', '123456789', 'Rooney@gmail.com', 'Rooney', '曼联', '小胖');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (4, 5, 'Suarez', '苏亚雷斯', '123456', '巴塞罗那', '123456789', 'Suarez@gmail.com', 'Suarez', '巴萨', '苏牙');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (5, 4, 'Buffon', '布冯', '123456', '都灵', '123456789', 'Buffon@gmail.com', 'Buffon', '尤文', '再战三十年');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (6, 4, 'Robben', '罗本', '123456', '慕尼黑', '123456789', 'Robben@gmail.com', 'Robben', '拜仁', '罗老汉');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (7, 3, 'Neymar', '内马尔', '123456', '巴塞罗那', '123456789', 'Neymar@gmail.com', 'Neymar', '巴萨', '桑巴精灵');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (8, 6, 'Xavi', '哈维', '123456', '巴塞罗那', '123456789', 'Xavi@gmail.com', ' Xavi', '巴萨', '中场大师');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (9, 2, 'Iniesta', '伊涅斯塔', '123456', '巴塞罗那', '123456789', 'Iniesta@gmail.com', 'Iniesta', '巴萨', '中场大师');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (10, 4, 'Puyol', '普约尔', '123456', '巴塞罗那', '123456789', 'Puyol@gmail.com', 'Puyol', '巴萨', '铁血队魂');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (11, 8, 'YaoMing', '姚明', '123456', '上海', '123456789', 'YaoMing@gmail.com', 'YaoMing', '休斯顿火箭', '中国篮球第一人');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (12, 1, 'LiuXiang', '刘翔', '123456', '上海', '123456789', 'LiuXiang@gmail.com', 'LiuXiang', '中国田径队', '亚洲飞人，110米栏第一人');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (13, 7, 'LiNa', '李娜', '123456', '武汉', '123456789', 'LiNa@gmail.com', 'LiNa', '中国网球', '中国网坛一姐');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (14, 5, 'YooJaeSuk', '刘在石', '123456', '首尔', '123456789', 'YooJaeSuk@gmail.com', 'YooJaeSuk', 'RunningMan', '队长');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (15, 4, 'KimJongKook', '金钟国', '123456', '安养市', '123456789', 'KimJongKook@gmail.com', 'KimJongKook', 'RunningMan', '能力者');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (16, 4, 'JeeSeokJin', '池石镇', '123456', '江原道', '123456789', 'JeeSeokJin@gmail.com', 'JeeSeokJin', 'RunningMan', '王鼻子');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (17, 3, 'Haha', '河东勋', '123456', '首尔', '123456789', 'Haha@gmail.com', 'Haha', 'RunningMan', '哈肉肉');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (18, 6, 'SongJiHyo', '宋智孝', '123456', '浦项市', '123456789', 'SongJiHyo@gmail.com', ' SongJiHyo', 'RunningMan', '王牌');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (19, 2, 'Gary', 'Gary', '123456', '蚕室', '123456789', 'Gary@gmail.com', 'Gary', 'RunningMan', '丑帅丑帅的');

insert into user (userId, departmentID, userAccount, userName, userPassword, userAddr, userMobileNum, userEMail, userWeChatNum, userComName, userComment) values (20, 4, 'LeeKwangSoo', '李光洙', '123456', '南扬州', '123456789', 'LeeKwangSoo@gmail.com', 'LeeKwangSoo', 'RunningMan', '长颈鹿');


insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (12, 'A001', 12, 'ALYC012', 0, '2016-2-27', '备注012');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (1, 'A006', 9, 'ALYC001', 3, '2016-7-24', '备注001');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (13, 'B005', 10, 'ALYC013', 19, '2016-5-27', '备注013');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (3, 'B001', 18, 'ALYC003', 16, '2016-12-22', '备注003');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (16, 'A010', 11, 'ALYC016', 5, '2016-3-27', '备注016');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (19, 'B005', 19, 'ALYC019', 15, '2016-6-7', '备注019');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (15, 'A005', 19, 'ALYC015', 2, '2016-3-9', '备注015');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (9, 'B001', 2, 'ALYC009', 4, '2016-9-14', '备注009');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (8, 'A002', 4, 'ALYC008', 10, '2016-2-9', '备注008');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (17, 'A002', 9, 'ALYC017', 1, '2016-3-8', '备注017');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (2, 'B001', 7, 'ALYC002', 18, '2016-9-21', '备注002');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (14, 'B004', 4, 'ALYC014', 14, '2016-4-12', '备注014');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (18, 'B004', 1, 'ALYC018', 7, '2016-2-5', '备注018');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (4, 'A008', 12, 'ALYC004', 6, '2016-1-1', '备注004');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (7, 'A002', 18, 'ALYC007', 8, '2016-12-10', '备注007');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (5, 'A002', 9, 'ALYC005', 9, '2016-2-18', '备注005');

insert into materialApply (materialApplyID, materialCode, userId, materialApplyCode, materialApplyVol, matrialApplyDate, applyComment) values (11, 'A002', 6, 'ALYC011', 12, '2016-8-6', '备注011');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (5, 9, 'B007', 1, 1, '1489-8-20', 7, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (7, 17, 'B008', 4, 2, '1740-4-3', 0, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (14, 11, 'A009', 1, 3, '546-6-11', 14, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (19, 7, 'A010', 10, 4, '1917-2-5', 13, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (16, 18, 'B007', 10, 5, '827-6-10', 12, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (3, 12, 'B002', 10, 7, '1276-7-25', 3, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (11, 2, 'B001', 7, 8, '690-4-9', 8, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (2, 12, 'B002', 1, 9, '102-2-21', 2, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (13, 19, 'B006', 8, 11, '1423-10-22', 16, '出库备注');

insert into materialOutput (materialOutputID, warehouseid, materialCode, userId, materialApplyID, materialOutputDate, materialOutputVol, materialOutputComment) values (12, 18, 'B006', 11, 12, '1489-8-20', 19, '出库备注');

/*==============================================================*/
/* Insert: outsource                                            */
/*==============================================================*/

insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 1, 1, 'outcode001', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 2, 2, 'outcode002', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 3, 3, 'outcode003', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 4, 4, 'outcode004', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 5, 2, 'outcode005', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 6, 2, 'outcode006', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 7, 1, 'outcode007', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 8, 2, 'outcode008', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22','2016-4-28', '待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate, outsourceState) values ( 1, 1, 9, 3, 'outcode009', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22', '2016-4-28','待收货') ;


insert into outsource ( userId, processorID, productionID, designID, outsourceCode, 
finishDate, osScheduleDate, labourCost, actualOutDate, referenceOutDate,outsourceState) values ( 1, 1, 10, 4, 'outcode010', '2016-4-20', '2016-4-5', 1000, 
'2016-4-22', '2016-4-28','待收货') ;
/*==============================================================*/
/* Insert: outsource_details                                    */
/*==============================================================*/

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 1 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 1 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 1 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 2 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 2 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 2 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 3 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 3 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 3 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 4 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 4 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 4 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 5 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 5 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 5 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 6 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 6 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 6 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 7 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 7 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 7 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);
insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 8 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 8 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 8 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 9 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 9 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 9 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 10 , '红色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 10 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

insert into outsourcedetail ( outsourceID, outsourceColor, outsourceXS, outsourceS,
outsourceM, outsourceL, outsourceXL, outsourceXXL, outsourceTotal) values ( 10 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 , 27);

/*==============================================================*/
/* Insert: techniquephase                                            */
/*==============================================================*/
insert into techniquephase (outsourceID,techPhaseStartingTime,techPhaseEndTime) values (6,null,null);

/*==============================================================*/
/* Insert: receive                                            */
/*==============================================================*/

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,1,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,2,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,3,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,4,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,5,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,6,'2016-4-20','送货') ;

insert into receive ( userId, processorID, outsourceID, receiveDate, receiveType ) values (1,1,7,'2016-4-20','送货') ;



insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (15, 6, 17, 'YYD_2015081324144823312', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (13, 11, 1, 'YYD_2015081387654236431', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (14, 3, 7, 'YYD_2015081394234745618', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (11, 9, 2, 'YYD_2015081364526546975', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (2, 12, 8, 'YYD_201508134239480934', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计 ', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (7, 15, 9, 'YYD_2015081306612554500', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (19, 3, 4, 'YYD_2015081311111111111', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (16, 4, 17, 'YYD_2015081322222222222', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (12, 16, 6, 'YYD_2015081333333333333', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计 F', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (4, 7, 19, 'YYD_2015081344444444444', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (3, 19, 3, 'YYD_2016051755555555555', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (10, 5, 7, 'YYD_2016051755585363555', '来样报价', ' 设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (8, 12, 12, 'YYD_2016051766666666666', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (5, 16, 6, 'YYD_2016051777777777777', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (18, 18, 18, 'YYD_2016051788888888888', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (1, 6, 16, 'YYD_2016051799999999999', '来样报价', '设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into sampleOrder (sampleOrderID, designID, userId, sampleOrderCode, sampleOrderSample, sampleOrderSource, sampleOrderTime, sampleOrderShellFabReq, sampleOrderAccReq, sampleOrderTechReq, sampleOrderModOpinion, sampleOrderComment) values (6, 16, 8, 'YYD_2016051700000000000', '来样报价', ' 设计师Mr.YU', '2016-05-08 12:34:26', '面料品质优良', '辅料品质优良', '采用三维立体设计', '尽量将多种材料改成单一材料', '做不好不给好评的哟');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (18, 10, 14, 5, 13, 1, 1, 15, 'zzl2015081324144823312', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 1, 'HT1234', '组装', '新款', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (3, 12, 12, 1, 7, 2, 2, 12, 'zzl2015081387654236431', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 1, 'HT1234', '直接生产', '翻单', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (16, 8, 12, 9, 8, 3, 3, 2, 'zzl2015081394234745618', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 1 , 'HT1234', '组装', '翻单', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (9, 1, 18, 11, 9, 4, 4, 1, 'zzl2015081364526546975', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '第一时间', '江苏南京', 1 , 'HT1234', '组装', '翻单', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (10, 16, 16, 6, 10, 5, 5, 2, 'zzl201508134239480934', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XXL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '第一时间', '江苏南京', 1 , 'HT1234', '组装', '翻单 ', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (15, 1, 11, 18, 1, 6, 6, 1, 'zzl2015081306612554500', '2016-05-05 09:45:54','2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'S', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '第一时间', '江苏南京', 1 , 'HT1234', '组装', '新款', '洗剪吹', '羊驼毛', 0,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (13, 9, 1, 8, 2, 7, 7, 2, 'zzl2015081311111111111', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'M', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内BIJH6WCN', '颜色要蓝色，物流快一点', '第一时间', '江苏南京', 0, '组装', '新款', 'LSUD3', '洗剪吹', '羊驼毛', 1,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (7, 1, 1, 1, 3, 8, 8, 3, 'zzl2015081322222222222', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XS', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '第一时间', '江苏南京 ', 0 , 'HT1234', '组装', '新款', '洗剪吹', '羊驼毛', 1,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (12, 16, 18, 9, 4, 9, 10, 4, 'zzl2015081333333333333', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'L', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '第一时间', '江苏南京', 0 , 'HT1234', '直接生产', '翻单', '洗剪吹', '羊驼毛', 1,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (4, 8, 19, 18, 5, 10, 11, 2, 'zzl2015081344444444444', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'XS', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 0 , 'HT1234', '直接生产', '翻单', '洗剪吹', '羊驼毛', 1,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (5, 9, 10, 12, 6, 11, 12, 2, 'zzl2016051755555555555', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-16', 'http://www.baidu.com', 'S', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 0 , 'HT1234', '组装', '新款', '洗剪吹', '羊驼毛', 1,'快递');

insert into orders (orderID, orderMakerId, customerID, chargeId, productionID, inquiryID, sampleID, designID, orderCode, orderDesignatedTime, orderDate, orderFinishDate, orderRefURL, orderSampleYardage, orderSewnInLabelReq, orderTechReq, orderComment, orderPriority, orderSource, orderDesignIsNew, orderContractNum, orderProcessType, orderType, orderSpecialTech, orderShellIngredient, orderChecked, distributeMethod) values (6, 15, 2, 8, 7, 12, 13, 1, 'zzl2016051755585363555', '2016-05-05 09:45:54', '2016-05-01 08:45:54', '2016-5-17', 'http://www.baidu.com', 'XL', '最高水温30℃缓和洗涤，不可漂白、悬挂晾干、不可烫熨', '面料辅料品质优良，尺寸在误差范围内', '颜色要蓝色，物流快一点', '普通', '江苏南京', 0, 'HT1234', '组装', '新款', '洗剪吹 ', '羊驼毛', 1,'快递');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (8, 9, 17, 'BLD080917SDGGSD', '待电话订购', '生产单补料', '2008-6-23', 'VKN5123G5SMK UM89N3EIQQDG');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (12, 17, 8, 'BLD121708SDAWCV', '待核对物料', '生产单补料', '2007-11-27', 'SLOT155WXM RK6GYPXW41CJ5V');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (14, 18, 5, 'BLD141805FGHRR', '待核对物料', '生产单补料', '2000-7-1', '6XAX8OUFA5S2CBC LE7NCVV8A');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (1, 14, 1, 'BLD011401DXZXCB', '待电话订购', '生产单补料', '2004-5-12', 'F8VN 9IHWPK ESGOE56YWP73F');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (3, 10, 18, 'BLD031018DHTE', '待审核', '生产单补料', '2001-7-6', 'G7WVPC13GCRI65JAXR2T0RJOM');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (16, 2, 15, 'BLD160215FAWFXC', '待审核', '生产单补料', '2008-9-8', 'NNQHYVSJOPGEFUD7TVN43GWC4');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (17, 14, 1, 'BLD171401GYRHJ', '待财务对账','生产单补料', '2011-1-1', 'N1YB5X6OH0GKB0DOKA429ATOA');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (18, 14, 17, 'BLD181417GRRYYS', '待财务对账', '生产单补料', '2006-7-2', 'XTH1JLW44UVN72O9HKN1I42 6');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (15, 14, 18, 'BLD151418AWFBC', '核对完成', '生产单补料', '2009-3-16', 'HCNR2JGJ562B6QK85KNS85J2P');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (9, 10, 7, 'BLD091007ZREHHF', '待电话订购', '生产单补料', '2002-12-2', 'SVE1SUR75W763X86I1BW0MEMD');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (10, 18, 16, 'BLD101816ERXVB', '待电话订购', '生产单补料', '2007-1-28', ' LRBKSDVEXQYXPP1RB6L0WV0W');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (13, 14, 17, 'BLD131417HGUTFS', '待电话订购', '生产单补料', '2007-2-17', 'H5366YL5WNLV7PQ9U5XOELAOT');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (11, 13, 7, 'BLD111307SFEJNT', '待审核', '生产单补料', '2003-8-23', '23M1YRQLM1E98A5XK43IDPK05');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (5, 15, 7, 'BLD051507FSFX', '核对完成', '生产单补料', '2015-11-25', 'BIUES8C7Y6L EQEE01T962RIA');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (2, 4, 7, 'BLD020407KIPI', '待审核', '生产单补料', '2000-9-16', 'GBRTI3XWFCA3YG7IPU7C4KQC9');

insert into supplement (supplementID, productionID, userId, supplementCode, supplementState, supplementType, supplementDate, supplementComment) values (7, 2, 12, 'BLD070212BMTRQ', '待电话订购', '生产单补料', '2015-5-6', 'RJ3N8JWWXRYSPO3W8U7AUEXX7');

insert into userRole (userRoleID, userId, roleID) values (1, 7, 1);

insert into userRole (userRoleID, userId, roleID) values (2, 6, 2);

insert into userRole (userRoleID, userId, roleID) values (3, 3, 3);

insert into userRole (userRoleID, userId, roleID) values (4, 4, 4);

insert into userRole (userRoleID, userId, roleID) values (5, 5, 5);

insert into userRole (userRoleID, userId, roleID) values (6, 18, 6);

insert into userRole (userRoleID, userId, roleID) values (7, 11, 7);

insert into userRole (userRoleID, userId, roleID) values (8, 17, 8);

insert into userRole (userRoleID, userId, roleID) values (9, 6, 9);

insert into userRole (userRoleID, userId, roleID) values (10, 18, 10);

insert into userRole (userRoleID, userId, roleID) values (11, 8, 11);

insert into userRole (userRoleID, userId, roleID) values (12, 2, 12);

insert into userRole (userRoleID, userId, roleID) values (13, 9, 13);

insert into userRole (userRoleID, userId, roleID) values (14, 12, 14);

insert into userRole (userRoleID, userId, roleID) values (15, 16, 15);

insert into userRole (userRoleID, userId, roleID) values (16, 15, 16);

insert into userRole (userRoleID, userId, roleID) values (17, 11, 17);

insert into userRole (userRoleID, userId, roleID) values (18, 1, 1);

insert into userRole (userRoleID, userId, roleID) values (19, 1, 2);

insert into userRole (userRoleID, userId, roleID) values (20, 1, 3);

insert into userRole (userRoleID, userId, roleID) values (21, 1, 4);

insert into userRole (userRoleID, userId, roleID) values (22, 1, 5);

insert into userRole (userRoleID, userId, roleID) values (23, 1, 6);

insert into userRole (userRoleID, userId, roleID) values (24, 1, 7);

insert into userRole (userRoleID, userId, roleID) values (25, 1, 8);

insert into userRole (userRoleID, userId, roleID) values (26, 1, 9);

insert into userRole (userRoleID, userId, roleID) values (27, 1, 10);

insert into userRole (userRoleID, userId, roleID) values (28, 1, 11);

insert into userRole (userRoleID, userId, roleID) values (29, 1, 12);

insert into userRole (userRoleID, userId, roleID) values (30, 1, 13);

insert into userRole (userRoleID, userId, roleID) values (31, 1, 14);

insert into userRole (userRoleID, userId, roleID) values (32, 1, 15);

insert into userRole (userRoleID, userId, roleID) values (33, 1, 16);

insert into userRole (userRoleID, userId, roleID) values (34, 1, 17);

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (13, 16, 12, '实物颜色与图片不符', '检验布料/裁剪检验/工艺检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-11 10:04:01', '已完结', '合格/合格/合格/合格/合格/合格/合格', 'ZJD100401_20160511');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (10, 8, 18, '检验布料/裁剪检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-25 08:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD080401_20160525');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (18, 19, 7, '检验布料/裁剪检验/工艺检验/外发加工检/收货前检/包装前全检', '2016-05-24 09:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD090401_20160524');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (11, 4, 13, '检验布料/裁剪检验/工艺检验/收货前检/后道检验（含贴标）/包装前全检', '2016-05-13 10:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD100401_20160513');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (16, 5, 10, '检验布料/工艺检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-12 11:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD110401_20160512');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (9, 11, 6, '裁剪检验/工艺检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-18 12:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD120401_20160518');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (17, 19, 6, '检验布料/裁剪检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-15 10:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD100401_20160515');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (14, 3, 12, '检验布料/裁剪检验/工艺检验/收货前检/后道检验（含贴标）/包装前全检', '2016-05-22 05:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD050401_20160522');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (12, 15, 8, '检验布料/裁剪检验/工艺检验/外发加工检/后道检验（含贴标）/包装前全检', '2016-05-21 03:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD030401_20160521');

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (4, 18, 18, '领围稍大', '检验布料/裁剪检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-22 02:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD020401_20160522');

insert into QC (QCID, userId, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (1, 7, 11, '检验布料/裁剪检验/工艺检验/外发加工检/收货前检/包装前全检', '2016-05-20 01:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD010401_20160520');

insert into QC (QCID, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (5, 12, '检验布料/裁剪检验/工艺检验/外发加工检/后道检验（含贴标）/包装前全检', '2016-05-21 04:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD040401_20160521');

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (15, 16, 13, '实物颜色与图片不符', '裁剪检验/工艺检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-24 05:04:01', '未进行', '合格/合格/合格/合格/合格/合格', 'ZJD050401_20160524');

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (6, 18, 17, '实物颜色与图片不符', '检验布料/工艺检验/外发加工检/收货前检/后道检验（含贴标）/包装前全检', '2016-05-23 12:04:01', '已完结', '合格/合格/合格/合格/合格/合格', 'ZJD120401_20160523');

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (19, 10, 18, '实物颜色与图片不符', '检验布料/裁剪检验/工艺检验/收货前检/后道检验（含贴标）', '1970-08-08 8:08:08', '未进行', '合格/合格/合格/合格/合格', 'ZJD110401_20160525');

insert into QC (QCID, userId, productionID, QCComment, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (7, 19, 11, '缝制是否平服', '外发加工检/后道检验（含贴标）/包装前全检', '1970-08-08 8:08:08', '已完结', '合格/合格/合格', 'ZJD080501_20160524');

insert into QC (QCID, productionID, QCStages, QCDesignateTime, QCState, QCResult, QCCode) values (3, 2, '工艺检验/外发加工检/收货前检/包装前全检', '1970-08-08 8:08:08', '未进行', '合格/合格/合格/合格', 'ZJD100401_20160525');

/*==============================================================*/
/* Insert: receive_details                                    */
/*==============================================================*/

insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 1 , '红色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 1 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 1 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7);

insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 2 , '红色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 2 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 2 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 );

insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 3 , '红色' , 2 , 3 , 4 , 5, 6 , 7);


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 3 , '黄色' , 2 , 3 , 4 , 5, 6 , 7);


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 3 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 );

insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 4 , '红色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 4 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 4 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 );

insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 5 , '红色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 5 , '黄色' , 2 , 3 , 4 , 5, 6 , 7 );


insert into receivedetail ( receiveID, receiveColor, receiveXS, receiveS,
receiveM, receiveL, receiveXL, receiveXXL) values ( 5 , '蓝色' , 2 , 3 , 4 , 5, 6 , 7 );

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (4, 12, '红', 12, 1, 16, 3, 10, 19);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (2, 13, '橙', 4, 3, 12, 16, 19, 5);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (1, 9, '黄', 2, 5, 15, 15, 12, 12);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (3, 16, '绿', 7, 6, 3, 5, 7, 8);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (13, 16, '青', 13, 16, 0, 2, 1, 15);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (12, 5, '蓝', 5, 0, 10, 14, 6, 16);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (7, 13, '紫', 6, 14, 7, 11, 4, 7);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (15, 5, '粉红', 19, 10, 11, 7, 17, 0);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (6, 7, '象牙白', 18, 13, 6, 18, 3, 1);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (17, 5, '棕色', 9, 17, 13, 4, 13, 9);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (16, 13, '咖啡色', 15, 8, 14, 17, 8, 18);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (9, 7, '墨绿色', 16, 18, 17, 6, 11, 4);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (19, 4, '朱红色', 17, 11, 4, 8, 0, 3);

insert into orderDetail (orderDetailID, orderID, orderColor, orderXS, orderS, orderM, orderL, orderXL, orderXXL) values (11, 12, '暗红色', 14, 4, 18, 1, 16, 13);

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (5, 9, 2, '自制',  17, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (10, 13, 14, '规划类',  5, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (13, 12, 3, '配置类',  9, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (3, 7, 1, '特征类',  4, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (11, 7, 10, '外购', 12, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (2, 7, 12, '委外加工',  16, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (4, 12, 11, '虚拟件',  9, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (17, 10, 10, '自制', 15, '订单要按时完成');

insert into orderMaterialDetail (orderMaterialID, orderID, supplyID, orderMaterialAttr,  orderVol, orderComment) values (15, 10, 7, '虚拟件',  13, '订单要按时完成');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime, materialCheckTime) values (2, 4, 14, 'CGD112447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00',  '2016-05-26 13:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime, materialCheckTime) values (12, 8, 12, 'CGD122447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00',  '2016-05-26 13:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime, materialCheckTime) values (15, 6, 13, 'CGD012447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00',  '2016-05-26 13:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime, materialCheckTime) values (6, 10, 6, 'CGD022447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00',  '2016-05-26 13:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime) values (17, 8, 10, 'CGD032447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime) values (18, 19, 17, 'CGD042447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime) values (4, 2, 1, 'CGD052447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime, financeCheckTime) values (7, 8, 19, 'CGD062447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00',  '2016-05-26 12:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime) values (14, 7, 8, 'CGD072447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime) values (9, 3, 18, 'CGD082447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime) values (16, 5, 2, 'CGD092447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime, faxTime) values (11, 12, 16, 'CGD012537_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00',  '2016-05-26 11:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime) values (13, 10, 5, 'CGD022537_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待传码单', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime, phoneOrderTime) values (3, 7, 9, 'CGD032127_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待传码单', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00',  '2016-05-26 10:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime) values (10, 4, 4, 'CGD043247_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待电话订购', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime, warehouseExamineTime) values (1, 9, 7, 'CGD052437_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待电话订购', 'shell',  '2016-05-26 08:00:00',  '2016-05-26 09:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType, materialExamineTime) values (8, 8, 11, 'CGD062441_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待库存审核', 'shell',  '2016-05-26 08:00:00');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (19, 4, 14, 'FLD072447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待库存审核', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (20, 8, 9, 'FLD082447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待电话订购', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (21, 6, 11, 'FLD092447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待传码单', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (22, 10, 6, 'FLD112447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (23, 8, 13, 'FLD122447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (24, 19, 17, 'FLD012447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（自有）', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (25, 2, 1, 'FLD022447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (26, 8, 19, 'FLD032447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待库存审核', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (27, 7, 7, 'FLD042447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待电话订购', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (28, 3, 18, 'FLD052447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待传码单', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (29, 5, 2, 'FLD062447_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（自有）', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (30, 12, 16, 'FLD072432_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (31, 10, 4, 'FLD082432_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待核对面料', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (32, 7, 12, 'FLD092421_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待财务对账', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (33, 4, 5, 'FLD112421_20160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待传码单', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (34, 9, 8, 'FLD12242120160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '待电话订购', 'accessory');

insert into purchase (purchaseID, userId, productionID, purchaseCode, ETA, ScheduledPurchaseDate, purDocumentedDate, purchaseComment, purchaseState, purchaseType) values (35, 8, 10, 'FLD13242120160526', '2016-05-28', '2016-05-28', '2016-05-26', '采购要按时', '采购完成（订购）', 'accessory');

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (8, 8, 1, 9, 15, 12, 9, 1, 5, 17,  '1970-08-08 8:08:08', 1);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (4, 8, 2, 4, 17, 2, 16, 12, 7, 5, '1970-08-08 8:08:08', 2);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (7, 11, 3, 4, 6, 18, 6, 17, 0, 15,  '1970-08-08 8:08:08', 3);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (17, 5, 4, 2, 14, 11, 13, 18, 18, 3,  '1970-08-08 8:08:08', 4);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (1, 15, 5, 18, 1, 15, 4, 8, 3, 0,  '1970-08-08 8:08:08', 6);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (15, 18, 6, 7, 12, 13, 7, 7, 17, 19,  null, 7);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (12, 17, 7, 15, 19, 8, 10, 10, 12, 13,  '1970-08-08 8:08:08', 9);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (13, 10, 8, 1, 2, 0, 15, 14, 16, 10,  '1970-08-08 8:08:08', 11);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (10, 9, 9, 4, 9, 4, 0, 15, 8, 12,  '1970-08-08 8:08:08', 12);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (5, 3, 10, 5, 8, 19, 18, 5, 15, 11,  '1970-08-08 8:08:08', 13);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (9, 3, 11, 9, 13, 7, 17, 3, 11, 18, '1970-08-08 8:08:08', 15);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (19, 3, 12, 2, 11, 9, 11, 16, 10, 4,  '1970-08-08 8:08:08', 16);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (14, 8, 13, 9, 5, 10, 1, 19, 2, 9,  '1970-08-08 8:08:08', 17);

insert into tailor (tailorID, tailorModelMakerID, productionID, tailorTailID, actualTailorXS, actualTailorS, actualTailorM, actualTailorL, actualTailorXL, actualTailorXXL, tailorStartingTime, orderDetailID) values (6, 2, 14, 4, 7, 17, 19, 9, 13, 14,  '1970-08-08 8:08:08', 19);

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (18, 1, '大', 16, 'AGO74I9KG595WP SUCDJ');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (8, 2, '大', 15, '46RBI1HIDL0E8SJON7R6');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (12, 3, '大', 8, ' 3KUMONF219NO8S91SXA');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (14, 4, '大', 18, 'GY4YXHAI5XDYE1OP9TPY');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (1, 5, '大', 6, 'E94Y6I0AEUTH4NS2DU9Y');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (3, 6, '大', 9, '2KIT7V83WB02 Q4BIKY2');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (16, 7, '大', 13, 'S10LEYFNX EBQEU978GF');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (17, 8, '中', 2, 'GJL FY1HI8AUPW605GN8');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (18, 9, '中', 12, 'FREYFW29QLB7S6LFP5CB');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (15, 10, '中', 19, 'F5EXN8CP9E6Q6CKYKO2R');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (9, 1, '中', 11, '8K XENOFCB0KDWW4PYCM');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (10, 1, '中', 5, 'UHBMYVNENM95WP1OHEK4');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (13, 3, '小', 10, 'NM1I3NRBJV7IQ26XNAD2');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (11, 4, '小', 14, 'M9D P1LNQ2DP EJAFYI4');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (5, 5, '小', 4, 'MTPAIHVMJV7U309V3J  ');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (2, 6, '小', 7, ' G2P7K1KP5E5CVUB7W5P');

insert into supplementMaterial (supplementID, supplyID, materialSpecification, materialVol, supUsage) values (7, 7, '小', 3, 'ND83 GOK9BD7WWRVXN9B');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (13, 1, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (4, 2, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID) values (14, 3);

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime) values (1, 4, '1970-08-08 8:08:08');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime) values (10, 5, '2016-05-01 00:00:00', '2016-05-02 01:00:00' );

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime) values (7, 6, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime) values (18, 7, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime) values (16, 8, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime) values (2, 10, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (15, 11, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (19, 12, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (11, 13, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (3, 14, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into sampleProcedure (sampleProcedureID, sampleOrderID, sampleProModelTime, sampleProMakeTime, sampleProConfirmTime, sampleProGradingTime, sampleProExamineTime, sampleProFinishTime) values (17, 15, '2016-05-01 00:00:00', '2016-05-02 01:00:00', '2016-05-03 03:00:00', '2016-05-04 04:00:00', '2016-05-05 05:00:00', '2016-05-06 06:00:00');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (16, 9, 1, 1, '20160407A1', '2016-04-07', '洗剪吹', '皮衣', '样板尺寸', 1, '作缝大小', '线距', '不能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (2, 16, 2, 1, '20160407A2', '2016-04-07', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (1, 18, 3, 1, '20160407B1', '2016-04-07', '剪刀剪', '麻布', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (14, 12, 4, 1, '20160408A1', '2016-04-08', '剪刀剪', '皮草', '样板尺寸', 1, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (8, 18, 5, 1, '20160408B2', '2016-04-08', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (18, 3, 6, 1, '20160416C2', '2016-04-16', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (10, 5, 7, 1, '20160410V2', '2016-04-10', '剪刀剪', '皮草', '样板尺寸', 1, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (9, 11, 8, 3, '20160411Q2', '2016-04-11', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (3, 9, 9, 1, '20160423Z2', '2016-04-23', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (11, 6, 10, 1, '20160422L2', '2016-04-22', '剪刀剪', '皮草', '样板尺寸', 1, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (5, 7, 11, 1, '20160413V2', '2016-04-13', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (19, 9, 12, 7, '20160507X2', '2016-05-07', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (12, 2, 13, 1, '20160511C2', '2016-05-11', '剪刀剪', '皮草', '样板尺寸', 1, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (13, 9, 14, 1, '20160507A2', '2016-05-07', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into technique (techid, userId, designID, processorID, techCode, techDate, technique, techShellType, techSampleSize, techModelFinish, techJointSize, techLineDistance, techPressingReq, techComment) values (7, 2, 15, 5, '20160503P2', '2016-05-03', '剪刀剪', '皮草', '样板尺寸', 0, '作缝大小', '线距', '能用熨斗烫', '备注');

insert into purchaseVendor (vendorId, purchaseID) values (1, 2);

insert into purchaseVendor (vendorId, purchaseID) values (4, 12);

insert into purchaseVendor (vendorId, purchaseID) values (17, 15);

insert into purchaseVendor (vendorId, purchaseID) values (3, 6);

insert into purchaseVendor (vendorId, purchaseID) values (19, 17);

insert into purchaseVendor (vendorId, purchaseID) values (16, 18);

insert into purchaseVendor (vendorId, purchaseID) values (12, 4);

insert into purchaseVendor (vendorId, purchaseID) values (9, 7);

insert into purchaseVendor (vendorId, purchaseID) values (11, 14);

insert into purchaseVendor (vendorId, purchaseID) values (6, 9);

insert into purchaseVendor (vendorId, purchaseID) values (14, 16);

insert into purchaseVendor (vendorId, purchaseID) values (15, 11);

insert into purchaseVendor (vendorId, purchaseID) values (18, 13);

insert into purchaseVendor (vendorId, purchaseID) values (8, 3);

insert into purchaseVendor (vendorId, purchaseID) values (2, 10);

insert into purchaseVendor (vendorId, purchaseID) values (7, 1);

insert into purchaseVendor (vendorId, purchaseID) values (10, 8);




insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (8, 1, 'A010', 19, 11, 2, '303-11-2', 18, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (7, 6, 'B009', 11, 11, 7, '1280-4-23', 7, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (9, 12, 'A003', 17, 9, 18, '1356-10-28', 4, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (14, 6, 'B003', 17, 1, 2, '515-2-19', 1, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (19, 4, 'A002', 15, 6, 18, '569-12-7', 8, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (1, 18, 'B004', 7, 12, 1, '1199-11-2', 14, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (4, 18, 'A001', 18, 12, 15, '1591-6-28', 13, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (11, 2, 'A003', 16, 16, 1, '443-1-2', 17, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (2, 7, 'B003', 16, 11, 1, '197-3-3', 2, '入库备注');

insert into materialInput (materialInputID, warehouseid, materialCode, userId, purchaseID, supplementID, materialInputDate, materialInputVol, materialInputComment) values (5, 16, 'A001', 5, 14, 9, '1021-6-21', 16, '入库备注');

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (16, 9, '袖口', 'M', 11);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (12, 1, '领口', 'XL', 1);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (19, 19, '裤子', 'XXL', 19);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (4, 3, '上衣', 'L', 16);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (7, 16, '上衣', 'M', 8);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (13, 1, '上衣', 'M', 4);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (11, 11, '裤子', 'S', 18);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (9, 19, '裤子', 'S', 7);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (1, 9, '领口', 'XL', 2);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (2, 11, '上衣', 'XXL', 15);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (3, 5, '领口', 'L', 0);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (10, 12, '袖口', 'M', 17);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (6, 16, '裤子', 'L', 9);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (17, 13, '上衣', 'XL', 12);

insert into techniqueInventory (techInventoryID, techid, techInPartName, techInMCode, techInTolerance) values (5, 10, '裤子', ' XXL', 3);

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (13, 7, 'D4P5B7BG5M', '8YKSF603Q  681P7BX677THXHRT2G3');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (2, 19, 'RQ1YLG 5BK', 'KVRJ1JWGWIUT3ADMCNYSXU KXQAV8V');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (7, 12, 'G3YI8V9TOT', '6QUX7X05RO93O6V2W4VASB10BBHBS4');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (5, 5, 'CCM7XEU72M', 'F5JA6I4TDPV UT2H6PC2 M945U28G1');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (19, 12, '1XP5EG2RW6', '5DHNI0851M8PWF0P5QO5K5K89W9 QW');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (6, 9, 'HSSWDKQUDH', 'K6YU0UWPWC4MK TOV0MJI08B8XIQKL');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (12, 2, 'MOVRM7THML', '5N95B1TR22SJ2YYJ9Y1JG327W4 U5A');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (1, 8, '5LR0JFOY0C', '52FJFJ8A353 GYQ4L3K5119176MIKJ');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (15, 11, '09OMLSVSM2', 'X7JG0LOM3SNWJ444NVGY1OVMY0CXPV');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (10, 19, 'BSF HSOA5Q', 'Y0CKVUIMU30A8L1YCVCDCR4P5A4SM0');

insert into specificTechnique (specificTechID, techid, specificTechPartName, specificTechnique) values (11, 12, '27QCV2A8UN', 'U5519P0YSIIOOLE40JAK915K8WHNU9');
