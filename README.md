# Land disturbance across the conterminous United States (US) 1988-2022

[This link](https://uconn-my.sharepoint.com/:u:/g/personal/shi_qiu_uconn_edu/EXBjYwosJTxLq_yCl7sJ2noB-2vNotkDmsGhjHfrOo8lSg?e=naegS9) provides temporary access to download the code package of production and analysis for peer review purposes. Each independent component is provided in a separate subfolder: "COLD" for disturbance detection, "ODACA" for disturbance agent classification, "Analysis" for data processing and analysis, and "Accuracy" for accuracy assessment and area adjustment.

The map is available through [Google Earth Engine](https://ee-gers.projects.earthengine.app/view/us-disturbance)

Other related (e.g., data downloading) are under development and will be available after publication.
## Overview of disturbance production
We leveraged long-term historical Landsat data and advanced time series analysis algorithms to map land disturbances and their associated agents across the U.S. from 1988 to 2022. The map production includes Landsat data compositing, training data collection, disturbance detection, and agent classification ([Figure 1](#figure1)).

<a name="figure1"></a>
![Workflow](https://github.com/GERSL/usdist/raw/main/figures/fig_flowchart_us_disturbance_product.svg)  
**Figure 1.** Workflow of U.S. disturbance product. COLD: COntinuous monitoring of Land Disturbance. ODACA: Object-based Disturbance Agent Classification Approach. MAX-RNB: Maximum ratio of near-infrared to blue band reflectance.
