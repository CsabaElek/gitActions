# OBG Static HTML

This repository contains static files served by OBG site without loading the main web application. 
Typical examples are Maintenance & Country-Block Pages.

These files are served via an nginx server that is owned and handled by OBG DevOps.  
See https://wikisson.betsson.local/x/CUdcCw for more information around the DevOps structure.

## Main Structure

All static files are placed under sub-directories per brand.

```
/brand/maintenance-page.html
/brand/country-blocked.html
```

For country-block pages that require *specific* text to be presented to users in the 
blocked country, each brand's country-blocked.html can be overridden by creating a duplicate file 
and suffixing its name with the ISO two-letter language code (double-check with DevOps for this)

```
/brand/country-blocked-<country-code>.html
```

There is a default brand directory as a fallback for any brands that do not yet have static files in this repository.

```
/default/maintenance-page.html
/default/country-blocked.html
/default/country-blocked-<country-code>.html
```

Each brand directory also includes a styles.css file for styling, and any flag or other icons are included 
in each brand directory in SVG format (remember to optimize the SVG).

⚠️ **It is very important not to change the flat directory structure inside each brand directory - the files are meant to be stored within the same directory, to simplify the web server configuration that serves them.**

## Maintenance Pages

Defined as maintenance-page.html under each respective brand's sub-directory in the repo.

Contains a "Sorry we are down for maintenance. We will be back shortly" message, in the main language for that site/brand, accompanied by all other languages that apply for the site, i.e. all languages for which the site operates/is marketed in.

## Country Block Pages

Defined as country-blocked.html under each respective brand's sub-directory in the repo.

⚠️ **As of 2021-05-26, all country-block.html files must include a reference to customer service contact channels (email/phone/live-chat) as per Ukrainian authority compliance requirements.**

Contains a "Please note that due to the new laws governing online games, this website is not available in this country.
Please contact customer support for further information." message, in the main language for that site/brand, accompanied by all other languages that apply for the site, i.e. all languages for which the site operates/is marketed in.

May also contain messages in languages that are not offered by the site but apply to blocked countries. An example of this is a country/market in which the brand/site previously operated.

### Country-Specific Block Pages

As per the **Main Structure** paragraph earlier, each country-block page can be overridden with a country-specific variant to load a different message or styling 
(or completely different file) for that brand.  
This is achieved by adding a file the two-letter ISO country-code appended to its file name, see the country-blocked-gr.html Greece country blocks as an example.

## Deployment/Upload to AWS

There is an auto-trigger on commits to **master** which uploads all the relevant files to Amazon S3, which are then served via CloudFront depending on configuration.
 See the [TeamCity project for more details](https://feteamcity.betsson.local/admin/editProject.html?projectId=Obg_Deployables_ObgFrontEnd_ObgMaintenancePagesUpload)
