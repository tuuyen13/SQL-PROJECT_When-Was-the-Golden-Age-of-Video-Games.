# SQL-Projects
This repository contains a collection of SQL projects in different scenarios.
## 📌 Case Studies
- [Case Study #1 - When Was the Golden Age of Video Games](#1-case-study-1---when-was-the-golden-age-of-video-games)
- [Case Study #2 - Covid Data Exploration](#2-case-study-2---covid-data-exploration)
- [Case Study #3 - Analyzing NYC Public School Test Result Scores](#3-case-study-3---analyzing-nyc-public-school-test-result-scores)

## 1. Case Study #1 - When Was the Golden Age of Video Games
<img width="200" src="https://github.com/tuuyen13/SQL-Projects/assets/94332486/87617be1-1c96-4619-8702-84a3904829df" align="center">

Video games are big business: the global gaming market is projected to be worth more than $300 billion by 2027 according to <a href="https://www.mordorintelligence.com/industry-reports/global-gaming-market">Mordor Intelligence</a>. With so much money at stake, the major game publishers are hugely incentivized to create the next big hit. But are games getting better, or has the golden age of video games already passed?</p>
In this project, we'll explore the top 400 best-selling video games created between 1977 and 2020. We'll compare a dataset on game sales with critics and user reviews to determine whether or not video games have improved as the gaming market has grown.</p>
Our database contains two tables. We've limited each table to 400 rows for this project, but you can find the complete dataset with over 13,000 games on <a href="https://www.kaggle.com/holmjason2/videogamedata">Kaggle</a>. </p>
<h3 id="game_sales"><code>game_sales</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>game</code></td>
<td>varchar</td>
<td>Name of the video game</td>
</tr>
<tr>
<td style="text-align:left;"><code>platform</code></td>
<td>varchar</td>
<td>Gaming platform</td>
</tr>
<tr>
<td style="text-align:left;"><code>publisher</code></td>
<td>varchar</td>
<td>Game publisher</td>
</tr>
<tr>
<td style="text-align:left;"><code>developer</code></td>
<td>varchar</td>
<td>Game developer</td>
</tr>
<tr>
<td style="text-align:left;"><code>games_sold</code></td>
<td>float</td>
<td>Number of copies sold (millions)</td>
</tr>
<tr>
<td style="text-align:left;"><code>year</code></td>
<td>int</td>
<td>Release year</td>
</tr>
</tbody>
</table>
<h3 id="reviews"><code>reviews</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>game</code></td>
<td>varchar</td>
<td>Name of the video game</td>
</tr>
<tr>
<td style="text-align:left;"><code>critic_score</code></td>
<td>float</td>
<td>Critic score according to Metacritic</td>
</tr>
<tr>
<td style="text-align:left;"><code>user_score</code></td>
<td>float</td>
<td>User score according to Metacritic</td>
</tr>
</tbody>
</table>

## 2. Case Study #2 - Covid Data Exploration
Explore all of the data on COVID-19 deaths and vaccinations. The complete COVID-19 dataset is a collection of the COVID-19 data maintained by [_Our World in Data_](https://ourworldindata.org/coronavirus)
### Confirmed deaths

| Variable                          | Description                                                                                                                                                                                               |
|:----------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `total_deaths`                    | Total deaths attributed to COVID-19. Counts can include probable deaths, where reported.                                                                                                                  |
| `new_deaths`                      | New deaths attributed to COVID-19. Counts can include probable deaths, where reported. In rare cases where our source reports a negative daily change due to a data correction, we set this metric to NA. |
| `new_deaths_smoothed`             | New deaths attributed to COVID-19 (7-day smoothed). Counts can include probable deaths, where reported.                                                                                                   |
| `total_deaths_per_million`        | Total deaths attributed to COVID-19 per 1,000,000 people. Counts can include probable deaths, where reported.                                                                                             |
| `new_deaths_per_million`          | New deaths attributed to COVID-19 per 1,000,000 people. Counts can include probable deaths, where reported.                                                                                               |
| `new_deaths_smoothed_per_million` | New deaths attributed to COVID-19 (7-day smoothed) per 1,000,000 people. Counts can include probable deaths, where reported.    

### Vaccinations

| Variable                                     | Description                                                                                                                                                                                                                                                                                                                                       |
|:---------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `total_vaccinations`                         | Total number of COVID-19 vaccination doses administered                                                                                                                                                                                                                                                                                           |
| `people_vaccinated`                          | Total number of people who received at least one vaccine dose                                                                                                                                                                                                                                                                                     |
| `people_fully_vaccinated`                    | Total number of people who received all doses prescribed by the initial vaccination protocol                                                                                                                                                                                                                                                      |
| `total_boosters`                             | Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol)                                                                                                                                                                                                     |
| `new_vaccinations`                           | New COVID-19 vaccination doses administered (only calculated for consecutive days)                                                                                                                                                                                                                                                                |
| `new_vaccinations_smoothed`                  | New COVID-19 vaccination doses administered (7-day smoothed). For countries that don't report vaccination data on a daily basis, we assume that vaccination changed equally on a daily basis over any periods in which no data was reported. This produces a complete series of daily figures, which is then averaged over a rolling 7-day window |
| `total_vaccinations_per_hundred`             | Total number of COVID-19 vaccination doses administered per 100 people in the total population                                                                                                                                                                                                                                                    |
| `people_vaccinated_per_hundred`              | Total number of people who received at least one vaccine dose per 100 people in the total population                                                                                                                                                                                                                                              |
| `people_fully_vaccinated_per_hundred`        | Total number of people who received all doses prescribed by the initial vaccination protocol per 100 people in the total population                                                                                                                                                                                                               |
| `total_boosters_per_hundred`                 | Total number of COVID-19 vaccination booster doses administered per 100 people in the total population                                                                                                                                                                                                                                            |
| `new_vaccinations_smoothed_per_million`      | New COVID-19 vaccination doses administered (7-day smoothed) per 1,000,000 people in the total population                                                                                                                                                                                                                                         |
| `new_people_vaccinated_smoothed`             | Daily number of people receiving their first vaccine dose (7-day smoothed)                                                                                                                                                                                                                                                                        |
| `new_people_vaccinated_smoothed_per_hundred` | Daily number of people receiving their first vaccine dose (7-day smoothed) per 100 people in the total population                                                                                                                                                                                                                                 |
## 3. Case Study #3 - Analyzing NYC Public School Test Result Scores
![Uploading schoolbus.jpg…]()

Every year, American high school students take SATs, which are standardized tests intended to measure literacy, numeracy, and writing skills. There are three sections - reading, math, and writing, each with a maximum score of 800 points. These tests are extremely important for students and colleges, as they play a pivotal role in the admissions process.

Analyzing the performance of schools is important for a variety of stakeholders, including policy and education professionals, researchers, government, and even parents considering which school their children should attend. 

In this notebook, we will take a look at data on SATs across public schools in New York City. Our database contains a single table:
<h3 id="schools"><code>schools</code></h3>
<table>
<thead>
<tr>
<th>column</th>
<th>type</th>
<th>description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>school_name</code></td>
<td><code>varchar</code></td>
<td>Name of school</td>
</tr>
<tr>
<td><code>borough</code></td>
<td><code>varchar</code></td>
<td>Borough that the school is located in</td>
</tr>
<tr>
<td><code>building_code</code></td>
<td><code>varchar</code></td>
<td>Code for the building</td>
</tr>
<tr>
<td><code>average_math</code></td>
<td><code>int</code></td>
<td>Average math score for SATs</td>
</tr>
<tr>
<td><code>average_reading</code></td>
<td><code>int</code></td>
<td>Average reading score for SATs</td>
</tr>
<tr>
<td><code>average_writing</code></td>
<td><code>int</code></td>
<td>Average writing score for SATs</td>
</tr>
<tr>
<td><code>percent_tested</code></td>
<td><code>numeric</code></td>
<td>Percentage of students completing SATs</td>
</tr>
</tbody>
</table>
<p>Let's familiarize ourselves with the data by taking a looking at the first few schools!</p>
