xquery version "1.0-ml";
module namespace localArrayRefTgt-from-localArrayRefSrc
    = "http://localArrayRefTgt/localArrayRefTgt-0.0.2-from-localArrayRefSrc-0.0.1";

import module namespace es = "http://marklogic.com/entity-services"
    at "/MarkLogic/entity-services/entity-services.xqy";

declare option xdmp:mapping "false";

(:
 This module was generated by MarkLogic Entity Services.
 Its purpose is to create instances of entity types
 defined in
 localArrayRefTgt, version 0.0.2
 from documents that were persisted according to model
 localArrayRefSrc, version 0.0.1

 Modification History:
 Generated at timestamp: 2016-11-19T00:32:26.892326-08:00
 Persisted by AUTHOR
 Date: DATE

 Target Model localArrayRefTgt-0.0.2 Info:

 Type Order: 
    primaryKey: CustomerID, ( in source: CustomerID )
    required: CustomerID, ( in source: CustomerID )
    range indexes: None, ( in source: CustomerID, OrderDate )
    word lexicons: CustomerID, ( in source: CustomerID, OrderDate )
 
 Type OrderDetail: 
    primaryKey: ProductID, ( in source: ProductID )
    required: ProductID, ( in source: None )
    range indexes: ProductID, Quantity, ( in source: None )
    word lexicons: ProductID, Quantity, ( in source: None )
 
:)


(:~
 : Creates a map:map instance representation of the target
 : entity type Order from an envelope document that
 : contains the source entity instance.
 : @param $source  Either an entity-services envelope document, or
 :  an XML node holding the canonical form of the source entity type.
 : @return A map:map instance that holds the data for the target
 :  entity type.
 :)

declare function localArrayRefTgt-from-localArrayRefSrc:convert-instance-Order(
    $source as node()
) as map:map
{
    let $source-node := localArrayRefTgt-from-localArrayRefSrc:init-source($source, 'Order')

    return
    json:object()
    (: Copies attachments from a source envelope document, if available :)
    =>localArrayRefTgt-from-localArrayRefSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with('$type', 'Order')
    (: The following lines are generated from the 'Order' entity type. :)
    =>   map:with('CustomerID',             xs:string($source-node/CustomerID))
    =>es:optional('OrderDate',              xs:dateTime($source-node/OrderDate))
    =>es:optional('ShipAddress',            xs:string($source-node/ShipAddress))
    =>es:optional('arr2arr',                es:extract-array($source-node/arr2arr, xs:string#1))
    =>es:optional('OrderDetails',           es:extract-array($source-node/OrderDetails, function($path) { json:object()=>map:with('$type', 'OrderDetail')=>map:with('$ref', $path/OrderDetail/text() ) }))

};
    
(:~
 : Creates a map:map instance representation of the target
 : entity type OrderDetail from an envelope document that
 : contains the source entity instance.
 : @param $source  Either an entity-services envelope document, or
 :  an XML node holding the canonical form of the source entity type.
 : @return A map:map instance that holds the data for the target
 :  entity type.
 :)

declare function localArrayRefTgt-from-localArrayRefSrc:convert-instance-OrderDetail(
    $source as node()
) as map:map
{
    let $source-node := localArrayRefTgt-from-localArrayRefSrc:init-source($source, 'OrderDetail')

    return
    json:object()
    (: Copies attachments from a source envelope document, if available :)
    =>localArrayRefTgt-from-localArrayRefSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with('$type', 'OrderDetail')
    (: The following lines are generated from the 'OrderDetail' entity type. :)
    =>   map:with('ProductID',              xs:integer($source-node/ProductID))
    =>es:optional('UnitPrice',              xs:integer($source-node/UnitPrice))
    =>es:optional('Quantity',               xs:integer($source-node/Quantity))

};
    


declare private function localArrayRefTgt-from-localArrayRefSrc:init-source(
    $source as node()*,
    $entity-type-name as xs:string
) as node()*
{
    if ( ($source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]))
    then $source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]
    else $source
};


declare private function localArrayRefTgt-from-localArrayRefSrc:copy-attachments(
    $instance as json:object,
    $source as node()*
) as json:object
{
    $instance
    =>es:optional('$attachments',
        $source ! fn:root(.)/es:envelope/es:attachments/node())
};