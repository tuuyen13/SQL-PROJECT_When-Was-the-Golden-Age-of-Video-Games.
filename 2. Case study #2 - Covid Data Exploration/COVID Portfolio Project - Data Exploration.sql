SELECT * 
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4


--SELECT * 
--FROM [Portfolio Project].dbo.CovidVaccinations
--ORDER BY 3,4

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

--Total cases vs total deaths
SELECT location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
FROM [Portfolio Project].dbo.CovidDeaths
where location = 'vietnam' and continent is not null
ORDER BY 1,2

--What percentage of population got covid
SELECT location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
FROM [Portfolio Project].dbo.CovidDeaths
where location = 'vietnam'  and continent is not null
ORDER BY 1,2

--The country has the highest infection rate compared to population
SELECT location, MAX(total_cases) as HighestInfectionCountry, population, MAX(total_cases/population)*100 as HighestPercentPopulationInfected
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY HighestPercentPopulationInfected desc

 --The countries has the highest death count per population
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount desc

--The continent has the highest death count per population
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount desc

--Global number

SELECT date, SUM(new_cases) as Total_Cases, SUM(CAST(new_deaths as int)) as Total_Deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM [Portfolio Project].dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--Total Population vs Vaccinations
SELECT d.continent, d.location, d.date,d.population, v.new_vaccinations,
SUM(CONVERT(int,v.new_vaccinations)) OVER(Partition by d.location ORDER BY d.location, d.date) as RollingPeopleVaccinated
FROM [Portfolio Project].dbo.CovidDeaths as d
JOIN [Portfolio Project].dbo.CovidVaccinations as v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent IS NOT NULL
order by 2,3


--Perform Calculation on Partition By in previous query
-- 1/ Using CTE
WITH PopulationVsVaccinate (continent, location, date, population, new_vaccinations,RollingPeopleVaccinated)
AS 
(
SELECT d.continent, d.location, d.date,d.population, v.new_vaccinations,
SUM(CONVERT(int,v.new_vaccinations)) OVER(Partition by d.location ORDER BY d.location, d.date) as RollingPeopleVaccinated
FROM [Portfolio Project].dbo.CovidDeaths as d
JOIN [Portfolio Project].dbo.CovidVaccinations as v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent IS NOT NULL
)
SELECT *, (RollingPeopleVaccinated/population)*100
FROM PopulationVsVaccinate


-- 2/ Use Temp table
DROP Table if exists PercentPopulationVaccinated 
CREATE TABLE PercentPopulationVaccinated 
(continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric, 
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into PercentPopulationVaccinated
SELECT d.continent, d.location, d.date,d.population, v.new_vaccinations,
SUM(CONVERT(int,v.new_vaccinations)) OVER(Partition by d.location ORDER BY d.location, d.date) as RollingPeopleVaccinated
FROM [Portfolio Project].dbo.CovidDeaths as d
JOIN [Portfolio Project].dbo.CovidVaccinations as v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent IS NOT NULL

SELECT *, (RollingPeopleVaccinated/population)*100
FROM PercentPopulationVaccinated


--Create view to store data
CREATE VIEW PercentPopulationVaccinated# AS
SELECT d.continent, d.location, d.date,d.population, v.new_vaccinations,
SUM(CONVERT(int,v.new_vaccinations)) OVER(Partition by d.location ORDER BY d.location, d.date) as RollingPeopleVaccinated
FROM [Portfolio Project].dbo.CovidDeaths as d
JOIN [Portfolio Project].dbo.CovidVaccinations as v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent IS NOT NULL