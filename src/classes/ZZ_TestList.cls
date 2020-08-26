/**
** @filename     : ZZ_TestList
* @projectname   :
* @author        : CHOI SEONGWON
* @date          : 2020-08-18 오후 3:24
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
public with sharing class ZZ_TestList {
    public class InitData extends I2ComClass.InitData{
        @AuraEnabled
        public List<I2ComClass.Option> getOptions{
            get{
                if(this.getOptions == null){
                    this.getOptions = I2ComUtil.makePickListOptions('Contact','Level__c',false,true);
                }
                return this.getOptions;
            }
            set;
        }
    }



    @AuraEnabled
    public static I2ComClass.InitData init(){
        InitData initData = new InitData();
        return initData;
    }

    @AuraEnabled
    public static I2ComClass.ResData search(String reqData, Integer pageSize, Integer pageNumber){
        String whereClause = '';

        whereClause = I2ComHelper.gfnRefinecondition(whereClause);

        I2ComClass.ResData resData = I2ComHelper.gfnQuery(
                'Description,BillingStreet,Name',
                'Account',
                whereClause,
                null,
                pageSize,
                pageNumber
        );
        return resData;
    }

}