# Land disturbance across the conterminous United States (US) 1988-2022

## Land disturbance and land disturbance agents
We define land disturbance as any relatively discrete event that substantially alters the biophysical state of the land surface, including both natural and anthropogenic drivers. Crucially, our definition focuses on detectable deviations from baseline conditions or established patterns, rather than implying an inherent negative value judgment sometimes associated with the term in specific ecological contexts. Consequently, some mapped disturbance events (e.g., certain agricultural practices or water disturbances) might be ecologically neutral or even positive in some contexts, but still represent detectable changes relevant to landscape dynamics. We leveraged the Landsat archive from 1982 to 2023 to generate a novel, 30-meter resolution dataset of annual land disturbance agents across the US, spanning 1988 to 2022 ([Figure 1](#figure1)), and their definitions are described in [this page](https://github.com/GERSL/usdist/wiki/Land-Disturbance-Agent).

<a name="figure1"></a>
![Map](https://github.com/GERSL/usdist/raw/main/figures/fig_agent_map.svg)  
**Figure 1.** Land disturbance agent maps across the US (1988-2022). a. US-wide map highlighting each pixel’s most recent disturbance agent, revealing the spatial distribution and diversity of disturbances at 30-meter resolution. The solid boundaries represent US Fifth National Climate Assessment regions, while the dashed boundaries indicate state border. b-h. Examples of disturbance agents from locations #1-7 of the US include human-directed disturbances (logging, construction, agricultural disturbance), wild disturbances (stress, wind/geohazard, fire), and water disturbance, respectively. The corresponding disturbance severity maps are presented in Extended Data Fig. 2. i-j. Latitudinal and longitudinal profiles of stacked disturbance areas. Area statistics (Mha) are calculated at 15-km intervals and stacked chronologically from 1988 to 2022 for different disturbance agents. All the figures share the same legend: brighter color curves represent earlier disturbance years (toward 1988), while darker colors indicate more recent years (toward 2022). An interactive application is available on [Google Earth Engine](https://ee-gers.projects.earthengine.app/view/us-disturbance).

## Overview of disturbance production
We leveraged long-term historical Landsat data and advanced time series analysis algorithms to map land disturbances and their associated agents across the U.S. from 1988 to 2022. The map production involved Landsat data compositing, training data collection, disturbance detection, and agent classification ([Figure 2](#figure2)). We first downloaded Landsat Collection 2 ARD images, with cloud <=80%, which included surface reflectance, brightness temperature, and quality assessment bands from Landsat 4-9, via the [USGS M2M API](https://m2m.cr.usgs.gov/). These images were then used to construct a consistent 32-day Landsat time series using single orbit path selection and adaptive compositing. Our land disturbance detection algorithm, COLD, uses a harmonic time series model regression to detect disturbances, providing information on disturbance location (pixel), timing (DOY), magnitude (derived from green, red, NIR, and two SWIR bands), and spectral-temporal characteristics (pre- and post-disturbance). To attribute the agent of land disturbance identified by COLD, we developed the Object-based Disturbance Agent Classification Approach (ODACA) by segmenting disturbance patches from COLD's annual maps, training random forest models with 165 spectral-topographic-spatial predictors, and assigning disturbance objects' agents using a majority vote of pixel-level classification. We compiled a comprehensive training dataset for agent classification by integrating various sources, such as LANDFIRE, LCT, MTBS, IDS, GSW, NLCD, and visual interpretation of over 50,000 samples. A separate random forest model for each Landsat ARD tile was trained using training data extracted from its surrounding 3 × 3 tiles for US-wide production.

<a name="figure2"></a>
![Workflow](https://github.com/GERSL/usdist/raw/main/figures/fig_flowchart_us_disturbance_product.svg)  
**Figure 2.** Workflow of U.S. disturbance product. COLD: COntinuous monitoring of Land Disturbance. ODACA: Object-based Disturbance Agent Classification Approach. MAX-RNB: Maximum ratio of near-infrared to blue band reflectance.

## Code Explanations
We provide the code resources (package name associated with the folder provided in this repository) for our publication, which are programmed in MATLAB (2022b) and Python (3.10):
- **LandsatData**: Data processing and density analysis (Python)
- **COLD**: Disturbance detection package (MATLAB)
- **ODACA**: Disturbance agent classification package (MATLAB + Python)
- **Analysis**: Code for data analysis and visualization (MATLAB + Python (Jupyter Notebook))
- **Accuracy**: Accuracy assessment and area adjustment (MATLAB + Python)

## US Land Disturbance Products
This product provides disturbance time, agent, agent classification confidence, magnitude, and severity for each year at the Landsat 30m pixel level. For detailed descriptions of each layer, see [Land Disturbance Dataset page](https://github.com/GERSL/usdist/wiki/Land-Disturbance-Dataset).

You can download the Collection 1 dataset from [this link](www.tbd.com).

## Other
Any other remaining resources can be provided upon request. Please contact the authors for further details.

## Reference
TBD
