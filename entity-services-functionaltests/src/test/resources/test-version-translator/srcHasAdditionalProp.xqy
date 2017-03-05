xquery version '1.0-ml';
module namespace srcHasMorePropTgt-from-srcHasMorePropSrc
    = 'http://marklogic.com/srcHasMoreProp/srcHasMorePropTgt-0.0.2-from-srcHasMorePropSrc-0.0.1';

import module namespace es = 'http://marklogic.com/entity-services'
    at '/MarkLogic/entity-services/entity-services.xqy';

declare option xdmp:mapping 'false';

(:
 This module was generated by MarkLogic Entity Services.
 Its purpose is to create instances of entity types
 defined in
 srcHasMorePropTgt, version 0.0.2
 from documents that were persisted according to model
 srcHasMorePropSrc, version 0.0.1

 Modification History:
 Generated at timestamp: 2016-12-02T14:25:23.240619-08:00
 Persisted by AUTHOR
 Date: DATE

 Target Model srcHasMorePropTgt-0.0.2 Info:

 Type Customer: 
    primaryKey: CustomerID, ( in source: CustomerID )
    required: None, ( in source: None )
    range indexes: None, ( in source: None )
    word lexicons: None, ( in source: None )
 
 Type Product: 
    primaryKey: ProductName, ( in source: ProductName )
    required: None, ( in source: None )
    range indexes: None, ( in source: None )
    word lexicons: None, ( in source: None )
 
:)


(:~
 : Creates a map:map instance representation of the target
 : entity type Customer from an envelope document
 : containing a source entity instance, that is, instance data
 : of type Customer, version 0.0.1.
 : @param $source  An Entity Services envelope document (<es:envelope>)
 :  or a canonical XML instance of type Customer.
 : @return A map:map instance that holds the data for Customer,
 :  version 0.0.2.
 :)

declare function srcHasMorePropTgt-from-srcHasMorePropSrc:convert-instance-Customer(
    $source as node()
) as map:map
{
    let $source-node := srcHasMorePropTgt-from-srcHasMorePropSrc:init-source($source, 'Customer')

    return
    json:object()
    (: If the source is an envelope or part of an envelope document,
     : copies attachments to the target
     :)
    =>srcHasMorePropTgt-from-srcHasMorePropSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with("$type", "Customer")
    (: The following lines are generated from the "Customer" entity type. :)    =>   map:with('CustomerID',             xs:string($source-node/CustomerID))
    =>es:optional('CompanyName',            xs:string($source-node/CompanyName))
    =>es:optional('Country',                xs:string($source-node/Country))
    (: The following properties are in the source, but not the target: 
    =>es:optional('NO TARGET',              xs:string($source-node/ContactName))
  :)

};
    
(:~
 : Creates a map:map instance representation of the target
 : entity type Product from an envelope document
 : containing a source entity instance, that is, instance data
 : of type Product, version 0.0.1.
 : @param $source  An Entity Services envelope document (<es:envelope>)
 :  or a canonical XML instance of type Product.
 : @return A map:map instance that holds the data for Product,
 :  version 0.0.2.
 :)

declare function srcHasMorePropTgt-from-srcHasMorePropSrc:convert-instance-Product(
    $source as node()
) as map:map
{
    let $source-node := srcHasMorePropTgt-from-srcHasMorePropSrc:init-source($source, 'Product')

    return
    json:object()
    (: If the source is an envelope or part of an envelope document,
     : copies attachments to the target
     :)
    =>srcHasMorePropTgt-from-srcHasMorePropSrc:copy-attachments($source-node)
    (: The following line identifies the type of this instance.  Do not change it. :)
    =>map:with("$type", "Product")
    (: The following lines are generated from the "Product" entity type. :)    =>   map:with('ProductName',            xs:string($source-node/ProductName))
    =>es:optional('UnitPrice',              xs:integer($source-node/UnitPrice))
    =>es:optional('SupplierID',             xs:integer($source-node/SupplierID))
    (: The following properties are in the source, but not the target: 
    =>es:optional('NO TARGET',              xs:string($source-node/Discontinued))
  :)

};
    


declare private function srcHasMorePropTgt-from-srcHasMorePropSrc:init-source(
    $source as node()*,
    $entity-type-name as xs:string
) as node()*
{
    if ( ($source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]))
    then $source//es:instance/element()[node-name(.) eq xs:QName($entity-type-name)]
    else $source
};


declare private function srcHasMorePropTgt-from-srcHasMorePropSrc:copy-attachments(
    $instance as json:object,
    $source as node()*
) as json:object
{
    $instance
    =>es:optional('$attachments',
        $source ! fn:root(.)/es:envelope/es:attachments/node())
};