/**
** @filename     : Tabtwo
* @projectname   :
* @author        : CHOI SEONGWON
* @date          : 2020-08-24 오후 2:53
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
public with sharing class Tabtwo {
    public class InitData extends I2ComClass.InitData {
    }

    @AuraEnabled
    public static I2ComClass.InitData init() {
        InitData initData = new InitData();
        return initData;
    }

    @AuraEnabled
    public static I2ComClass.ResData search(String reqData, Integer pageSize, Integer pageNumber){
        String whereClause = '';

        whereClause = I2ComHelper.gfnRefineCondition(whereClause);

        I2ComClass.ResData resData = I2ComHelper.gfnQuery(
                'Id, Name, Department',
                'Contact',
                whereClause,
                null,
                pageSize,
                pageNumber
        );

        return resData;
    }

}

