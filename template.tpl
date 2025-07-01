___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Items to Facebook Object Converter",
  "description": "This variable template easily converts GA4 Items structure to the Facebook object structure.\nIt is useful to track the ecommerce events of the FB Pixel and FB Conversion API through the GA4 Items.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "defaultCurrency",
    "displayName": "Default currency",
    "simpleValueType": true,
    "help": "Enter the default currency (eg. USD, EUR, GBP etc.)",
    "alwaysInSummary": true,
    "defaultValue": "EUR"
  },
  {
    "type": "SELECT",
    "name": "productType",
    "displayName": "Content Type",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "product",
        "displayValue": "product"
      },
      {
        "value": "product_group",
        "displayValue": "product_group"
      },
      {
        "value": "home_listing",
        "displayValue": "home_listing"
      },
      {
        "value": "hotel",
        "displayValue": "hotel"
      },
      {
        "value": "flight",
        "displayValue": "flight"
      },
      {
        "value": "destination",
        "displayValue": "destination"
      },
      {
        "value": "vehicle",
        "displayValue": "vehicle"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "product",
    "alwaysInSummary": true,
    "help": "It should be set to \u0027product\u0027 or \u0027product_group\u0027:\u003cul\u003e\u003cli\u003eUse \u0027product\u0027, if the keys you send represent products. Sent keys could be content_ids or contents.\u003c/li\u003e\u003cli\u003eUse \u0027product_group\u0027, if the keys you send in content_ids represent product groups. Product groups are used to distinguish products that are identical but have variations such as color, material, size or pattern.\u003c/li\u003e\u003c/ul\u003e"
  },
  {
    "type": "CHECKBOX",
    "name": "use_datalayer",
    "checkboxText": "Use Data Layer (GA4 Items structure)",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": true,
    "help": "You can use \u003ca href\u003d\"https://tagmanager.google.com/gallery/#/owners/matteo-zambon-gtm/templates/EEC-dataLayer-Builder-for-GA4\" target\u003d\"_blank\"\u003eEEC dataLayer Builder for GA4\u003c/a\u003e variable if you use Google Universal Analytics ecommerce object",
    "subParams": [
      {
        "type": "SELECT",
        "name": "alternative_items",
        "displayName": "Read Data Items Object from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "alternative_value",
        "displayName": "Read transaction value from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "alternative_transaction_id",
        "displayName": "Read transaction id from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "use_default_events",
    "checkboxText": "Use GA4 default events",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": true,
    "help": "You can use \u003ca href\u003d\"https://tagmanager.google.com/gallery/#/owners/matteo-zambon-gtm/templates/EEC-dataLayer-Builder-for-GA4\" target\u003d\"_blank\"\u003eEEC dataLayer Builder for GA4\u003c/a\u003e variable if you use Google Universal Analytics ecommerce object",
    "subParams": [
      {
        "type": "SELECT",
        "name": "alternative_eventName",
        "displayName": "Read Data from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_default_events",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const dl = require('copyFromDataLayer');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const ga4Events = ['view_item_list', 'select_item', 'view_item', 'remove_from_cart', 'add_to_cart', 'add_to_wishlist', 'view_promotion', 'select_promotion', 'view_cart', 'begin_checkout', 'add_shipping_info', 'add_payment_info', 'purchase', 'refund'];

var ecommerce_items = [];
var ecommerce = [];
var event = '';

if(data.use_datalayer === false){  
  ecommerce_items = data.alternative_items;
  ecommerce = data.alternative_items;
}
else{
  ecommerce_items = dl('ecommerce', 1).items;
  ecommerce = dl('ecommerce', 1);
}

if(data.use_default_events === false){
  event = data.alternative_eventName;
}
else{
  event = dl('event');  
}


if(ga4Events.indexOf(event) >= 0){
  let fbObj = {};    
  let totalValue;
  let prods = ecommerce_items;

  let idList = prods.map(function(prod) {
    if(prod.hasOwnProperty('item_id')){
      return prod.item_id.toString();
    }
  });

  if(event === 'purchase'){
    if(data.use_datalayer === false){  
      totalValue = data.alternative_value;
      fbObj.order_id = data.alternative_transaction_id;
    }
    else
    {
      totalValue = ecommerce.value;
      fbObj.order_id = ecommerce.transaction_id;
    }
  }
  else{
    totalValue = prods.reduce(function(cur, acc) {
      if (!(acc.quantity)){
        acc.quantity = 1;
      }
      if(acc.hasOwnProperty('price')){
        return cur + (acc.price * acc.quantity);
      }
    }, 0);
  }

  let totalQuantity = prods.reduce(function(cur, acc) {
    if (!(acc.quantity))
      acc.quantity = 1;
    return cur + makeInteger(acc.quantity);
  }, 0);

  let contentsArray = prods.map(function(prod) {
    if (!(prod.quantity)){
      prod.quantity = 1;
    }
    if(prod.hasOwnProperty('item_id') && prod.hasOwnProperty('price'))
      return {
        id: prod.item_id.toString(),
        item_price: makeNumber(prod.price),
        quantity: makeInteger(prod.quantity)
      };
  });

  fbObj.content_ids = idList;
  fbObj.value = totalValue;
  fbObj.num_items = totalQuantity;
  fbObj.contents = contentsArray;   
  fbObj.content_type = data.productType;
  if(ecommerce.hasOwnProperty('currency')){
    fbObj.currency = ecommerce.currency;
  }
  else{
    fbObj.currency = data.defaultCurrency;
  }        

  return fbObj;
}
else{
  return {};
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "ecommerce.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 6/11/2021, 5:03:51 PM
