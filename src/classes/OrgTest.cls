/**
 * Created by MS on 2020-05-07.
 */

public with sharing class OrgTest {

    @AuraEnabled
public static void create(Contact con) {
System.debug('con : ' + JSON.serializePretty(con));

if(con != null){
insert con;
}
}
}