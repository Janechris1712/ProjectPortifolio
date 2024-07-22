SELECT *
FROM PortfolioProject.dbo.CovidDeaths
order by 3,4

SELECT *
FROM PortfolioProject.dbo.CovidVaccinations
order by 3,4

--select data we are going to be using
SELECT location,date,new_cases, total_deaths,population_density
FROM PortfolioProject.dbo.CovidDeaths
order by 1,2

--looking at the total cases VS total deaths
SELECT location,date,new_cases, (total_deaths/new_cases)
FROM PortfolioProject.dbo.CovidDeaths
order by 1,2

SELECT location,date,new_cases, (total_deaths/new_cases) *100 AS DeathPercentage
FROM PortfolioProject.dbo.CovidDeaths
order by 1,2

--this shows likelihood of dying if you contract covid in your country
SELECT location,date,new_cases,(total_deaths/new_cases) *100 AS DeathPercentage
FROM PortfolioProject.dbo.CovidDeaths
where location like '%states%'
order by 1,2

--looking at the total_cases VS population
SELECT location,date,new_cases, population_density,(new_cases/population_density) AS PercentagePolatedInfected
FROM PortfolioProject.dbo.CovidDeaths
order by 1,2

SELECT location,date,new_cases,population_density,(new_cases/population_density)*100 AS PercentagePolatedInfected
FROM PortfolioProject.dbo.CovidDeaths
order by 1,2

SELECT location,date,new_cases,population_density,(new_cases/population_density)*100 AS PercentagePolatedInfected
FROM PortfolioProject.dbo.CovidDeaths
where location like '%states%'
order by 1,2

-- looking at counyries with highest infection rate compared to popupulation
SELECT location,date,new_cases,population_density,MAX(cast(total_deaths as int)) AS HighestInfectionCount,
MAX(total_deaths/population_density)*100 AS PercentagePolatedInfected
FROM PortfolioProject.dbo.CovidDeaths
where location like '%states%'
Group by location, population_density
order by PercentagePolatedInfected desc

SELECT continent,MAX(CAST(total_deaths as int)) AS TotalDeathDeathCount
FROM PortfolioProject.dbo.CovidDeaths
where continent is  NOT NULL
GROUP BY location
ORDER BY TotalDeathDeathCount