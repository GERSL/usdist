# Land disturbance across the conterminous United States (US) 1988-2022

## Land disturbance and land disturbance agents
We define land disturbance as any relatively discrete event that substantially alters the biophysical state of the land surface, including both natural and anthropogenic drivers. Crucially, our definition focuses on detectable deviations from baseline conditions or established patterns, rather than implying an inherent negative value judgment sometimes associated with the term in specific ecological contexts. Consequently, some mapped disturbance events (e.g., certain agricultural practices or water disturbances) might be ecologically neutral or even positive in some contexts, but still represent detectable changes relevant to landscape dynamics. We leveraged the Landsat archive from 1982 to 2023 to generate a novel, 30-meter resolution dataset of annual land disturbance agents across the US, spanning 1988 to 2022 ([Figure 1](#figure1)), and their definitions are described in [this page](https://github.com/GERSL/usdist/wiki/Land-Disturbance-Agent).

<a name="figure1"></a>
![Map](https://github.com/GERSL/usdist/raw/main/figures/fig_agent_map.svg)  
**Figure 1.** Land disturbance agent maps across the US (1988-2022). a. US-wide map highlighting each pixel’s most recent disturbance agent, revealing the spatial distribution and diversity of disturbances at 30-meter resolution. The solid boundaries represent US Fifth National Climate Assessment regions, while the dashed boundaries indicate state border. b-h. Examples of disturbance agents from locations #1-7 of the US include human-directed disturbances (logging, construction, agricultural disturbance), wild disturbances (stress, wind/geohazard, fire), and water disturbance, respectively. The corresponding disturbance severity maps are presented in Extended Data Fig. 2. i-j. Latitudinal and longitudinal profiles of stacked disturbance areas. Area statistics (Mha) are calculated at 15-km intervals and stacked chronologically from 1988 to 2022 for different disturbance agents. All the figures share the same legend: brighter color curves represent earlier disturbance years (toward 1988), while darker colors indicate more recent years (toward 2022). An interactive application is available on [Google Earth Engine](https://ee-gers.projects.earthengine.app/view/us-disturbance).

<a name="table1"></a>
**Table 1.** Definition of the land disturbance causal agent classes. The first disturbance over time was identified if multiple disturbances occurred within one year, and only the disturbance that caused lasting (>6 months) ecological impacts was mapped.
| **Classification**       | **Description**                                                                                                                                          |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Human-directed**        |                                                                                                                                                          |
| Logging                  | Human-induced removal of trees from a forested area.                                                                                                     |
| Construction             | Lands (either in a vegetated or non-vegetated state) cleared for development (e.g., buildings, mining, solar panels, and golf course) or previously built-up land (also including concrete parking lot) is intensified with new structures. |
| Agricultural disturbance | Lands, where agriculture activities are the major cause of the disturbance, such as agriculture expansion, intensification, and abandonment, as well as changes in management practices (e.g., changing irrigation methods, shifting to different crops, with/without cover crops, rotation change, and tillage practice changes). |
| **Wild**                 |                                                                                                                                                          |
| Stress                   | Vegetated lands, where the condition of vegetation (i.e., grass, shrub, and tree) is changed to a less favorable status by natural factors, such as exotic pest or pathogen outbreaks, and drought. |
| Wind/Geohazard           | Lands scattered with natural or artificial materials were physically damaged by wind (e.g., hurricanes, tornadoes, storms) and geohazard (e.g., landslides, earthquakes, volcanic eruptions, and tsunamis). |
| Fire                     | Burned areas due to wildfires or prescribed fires on all land surfaces, such as forests, shrublands, or grasslands.                                         |
| Water disturbance        | A rising and overflowing of water onto normally dry land (e.g., flooding), or the decrease of water resulting in the conversion of formerly waterlogged areas into dry land. It can occur during heavy rains, when ocean waves come on shore, when snow melts quickly, when dams or levees break, or when water diversion structures were changed. |
| **Other**                |                                                                                                                                                          |
| Natural vegetation succession | The land cover types are altered by the process of the structure of a biological community changing over time (e.g., transitioned from grass to shrub, and all the way to forest) with enough time and adequate recovery speed. |
| Climate variability      | The short-term variations in climate patterns (e.g., months, seasons, or years).                                                                          |
| Variation in water quality | Variations in the chemical composition, physical characteristics, biological parameters, pH levels, temperature fluctuations, and source contamination of water. |
| False-positive change    | Variations in the chemical composition, physical characteristics, biological parameters, pH levels, temperature fluctuations, and source contamination of water. |
| Isolated disturbance     | Any disturbance less than the minimum mapping unit, i.e., four Landsat pixels.                                                                            |
| Stable                   | The absence of changes in land cover types and a lack of variations in spectral bands of satellite remote sensing data over time.                          |


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

## US land disturbance products

### Product layers
- **Disturbance Time**:
  - Delivered file name: *_TIME.tif
- **Disturbance Agent**:
  - Delivered file name: *_AGENT.tif
- **Disturbance Magnitude**:
  - Delivered file name: *_MAG.tif
  
## Other
Any other remaining resources can be provided upon request. Please contact the authors for further details.

## Reference
TBD
