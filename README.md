# GA4-Items-to-Facebook-Object-Converter


I included for you both a non-technical guide (1) and a technical configuration guide (2) about GIFOC:  

## 1. What is GIFOC and which problem does it solves?

**GIFOC** stands for "**GA4 Items to Facebook Object Converter**".

It is a GTM template for a quick and accurate Facebook Pixel setup. 

In short, GIFOC reuses the parameters you already inserted in GA4 and configures the Facebook Pixel for you, saving you a lot of time (and a boooring configuration...) 

Therefore, with GIFOC you can install FB Pixel in a superfast way and have more accurate data.

But there is more. 

Thanks to its integration with Google Analytics 4, the GIFOC template also helps you in managing the Facebook Conversion API (I will give you all the details soon).

However...

As you may already guessed, to use GIFOC you need to have Google Analytics 4 (GA4) installed. 

If you haven't installed it yet, don't worry: you can install GA4 and - at the same time - continue to use Google Universal Analytics.

Don't know how to install GA4?

Here is the official guide by Google: https://support.google.com/analytics/answer/10270783

You can get GIFOC from this link:

https://tagmanager.google.com/gallery/#/owners/matteo-zambon-gtm/templates/GA4-Items-to-Facebook-Object- Converter

I will soon write a longer post with all the details about GIFOC and its usage.

In the meantime, if you are going to try GIFOC and/or you would need more info about how it works, 
please send me an email at help@tagmanageritalia.it : I’d love to get some feedback from you. 

## 2. GIFOC Confiuguration Guide (technical)
*Do you use Items object of Google Analytics 4 in your dataLayer?*

Well, this variable is a smart way to track the Pixel Facebook and Facebook Conversion API using the GA4 items.

If you use the Custom Tag Template:

https://www.simoahava.com/custom-templates/facebook-pixel/

and you have GA4 items then you can use this variable.

You can use this for settings GA4 

https://www.simoahava.com/analytics/facebook-conversions-api-gtm-server-side-tagging/


**Guide step by step:**

## Import the custom variable from the gallery

Go to the GTM gallery variable and search "GA4 Items to Facebook Object Converter"
![select GA4 Items to Facebook Object Converter from Template Gallery](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/select-GA4-Items-to-Facebook-Object-Converter-from-Template-Gallery.png)


## The configuration: 
Create a new variable an choose GA4 Items to Facebook Object Converter

![select GA4 Items to Facebook Object Converter](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/select-GA4-Items-to-Facebook-Object-Converter.png)

You can change:
- Currency
- Product Type

![GA4 Items to Facebook Object Converter details](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/GA4-Items-to-Facebook-Object-Converter-details.jpg)


# Update your Facebook Custom Tag Template :
## Open your Facebook Tag

In Facebook Tags on the **"Object Properties From Variable"** choose the variable **GA4 Items to Facebook Object Converter**. Do it for all Facebook Tags


![use GA4 Items to Facebook Object Converter variable on your Facebook Tag](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/use-GA4-Items-to-Facebook-Object-Converter-variable-on-your-Facebook-Tag.png)


# Now Debug it :)

Ok, go to debug it :)

![debug 1](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/debug-1.png)

![debug 2](https://www.tagmanageritalia.it/GTM/guida/uploads/2021/06/debug-2.png)

Great, it works. Now you can use the same data of GA4 directly on your Facebook Tag!

Let me know if it is helpful for you

Buon Tag :)
