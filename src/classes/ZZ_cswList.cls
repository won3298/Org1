/**
** @filename     : ZZ_cswList
* @projectname   :
* @author        : CHOI SEONGWON
* @date          : 2020-08-11 오후 1:20
* @group         :
* @group-content :
* @description   :
* @tester        :
* @reference     :
* @copyright     : Copyright © I2max. All Rights Reserved.
* @modification Log
* ===============================================================
* ver     date             author              description
* ===============================================================
  0.1                            Create
 */
public with sharing class ZZ_cswList {
    public class InitData extends I2ComClass.InitData{
//        @AuraEnabled public List<I2ComClass.Option> status{
//            get{
//                if(this.status == null){
//                     this.status = I2ComUtil.makePickListOptions('Case','Status',false, true);
//                }
//                return this.status;
//            }
//            set;
//        }
    }
//    @AuraEnabled
//    public static List<I2ComClass.Option> options(){
//        return I2ComUtil.makePickListOptions('Account','NumberofLocations__c',false,true);
//    }

    @AuraEnabled
    public static I2ComClass.InitData init() {
        InitData initData = new InitData();
        return initData;
    }

    @AuraEnabled
    public static I2ComClass.ResData search(String reqData, Integer pageSize, Integer pageNumber){
        String whereClause = '';
        Map<String, String> paramMap = I2ComHelper.gfnCheckCondition(reqData);

        if(I2ComHelper.gfnHasCondition(paramMap, 'status')) {
            whereClause += ' AND Status = \'' + paramMap.get('status') + '\'' + '\n';
        }

        if(I2ComHelper.gfnHasCondition(paramMap,'numberoflocations')){
            if(paramMap.get('numberoflocations')=='1'){
                whereClause +=' AND Account.NumberofLocations__c <= 6 ' +'\n';
            }
        }

        if(I2ComHelper.gfnHasCondition(paramMap,'accountName')){
            whereClause += ' AND Account.Name LIKE \'%' + paramMap.get('accountName') + '%\'\n';
        }

        whereClause = I2ComHelper.gfnRefineCondition(whereClause);

        I2ComClass.ResData resData = I2ComHelper.gfnQuery(
                'Status, Account.Id, Account.Name, Account.NumberofLocations__c',
                'Case',
                whereClause,
                null,
                pageSize,
                pageNumber
        );

        return resData;
    }

}