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

    }

    @AuraEnabled
    public static I2ComClass.InitData init(){
        InitData initData = new InitData();
        return initData;
    }

    @AuraEnabled
    public static I2ComClass.ResData search(String reqData, Integer pageSize, Integer pageNumber){
        String whereClause = '';
        Map<String, String> paramMap = I2ComHelper.gfnCheckCondition(reqData);

        if(I2ComHelper.gfnHasCondition(paramMap,'accountName')){
            whereClause += ' And AND Name LIKE \'%' + paramMap.get('accountName') + '%\'' + '\n';
        }

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