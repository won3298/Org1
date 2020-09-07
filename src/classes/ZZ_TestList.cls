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

//    public class InitData extends I2ComClass.InitData{
//        @AuraEnabled
//        public List<I2ComClass.Option> getOptions{
//            get{
//                if(this.getOptions == null){
//                    this.getOptions = I2ComUtil.makePickListOptions('Contact','Level__c',false,true);
//                }
//                return this.getOptions;
//            }
//            set;
//        }
//    }

//    @AuraEnabled(Cacheable=true)
//    public static List<I2ComClass.Option> getOptions() {
//        return I2ComUtil.makePickListOptions('Contact', 'Level__c', false, true);
//    }

    //기업명 구함
    @AuraEnabled(Cacheable=true)
    public static List<I2ComClass.Option> getAccountName() {
        return I2ComUtil.makePickListOptions('Account', 'AccountName__c', false, true);
    }
    //기업의 제품을 구함
    @AuraEnabled(Cacheable=true)
    public static List<I2ComClass.Option> getProduct(final String accountname) {
         return I2ComDependencyUtil.getDependentPickListOptions('Account', 'AccountName__c','Product__c', accountname,true, true);
    }

    //제품의 제품명을 구함
    @AuraEnabled(Cacheable=true)
    public static List<I2ComClass.Option> getProductName(final String productname) {
        return I2ComDependencyUtil.getDependentPickListOptions('Account', 'Product__c','ProductName__c', productname,true, true);
    }



//    @AuraEnabled
//    public static I2ComClass.InitData init(){
//        InitData initData = new InitData();
//        return initData;
//    }

    @AuraEnabled
    public static I2ComClass.ResData search(String reqData, Integer pageSize, Integer pageNumber){
        String whereClause = '';
//        Map<String, String> paramMap = I2ComHelper.gfnCheckCondition(reqData);


        whereClause = I2ComHelper.gfnRefinecondition(whereClause);

        I2ComClass.ResData resData = I2ComHelper.gfnQuery(
                'Id, Description, BillingStreet, Name',
                'Account',
                whereClause,
                null,
                pageSize,
                pageNumber
        );
        return resData;
    }
    public static void sObjectsInsert(){
        Account store = new Account();
        store.Name = 'The Tea Factory';
        store.AccountNumber = '356281';
        store.Phone = '555-0158';
        insert store;
    }

}