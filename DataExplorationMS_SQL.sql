 select *
 From SUCHI..CovidDeaths$
 order by 3,4;

 --select *
 --From SUCHI..CovidVaccinations$
 --order by 3,4;

 --Select Data we are going to be using
 
 Select location, date, total_cases,
 new_cases, total_deaths, population
 From SUCHI..CovidDeaths$
 order by 1,2; 

 --Looking at Total Cases vs Total Deaths
  Select location,date,total_cases,
  total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
  From SUCHI..CovidDeaths$
  Where location like '%states%'
  order by 1,2;

  --Looking at Total Cases vs Population
 --Shows what percentage of population got covid

 Select location,date,population,total_cases,
   (total_cases/population)*100 as PercentagePopulationInfected
  From SUCHI..CovidDeaths$
  Where location like '%states%'
  order by 1,2;

  --Looking at countries with highest Infection
  --Rate compared to population

  Select location,population,MAX(total_cases) as HighestInfectionCount ,
  Max((total_cases/population))*100 as PercentagePopulationInfected
  From SUCHI..CovidDeaths$
  where continent is not null
  Group by location , population
  order by PercentagePopulationInfected desc;

  --Showing Countries with Highest Death 
  --Count per Population

  Select location,MAX(cast(total_deaths as int)) as TotalDeathCount
  From SUCHI..CovidDeaths$
  where continent is not null
  Group by location 
  order by TotalDeathCount desc;

  ---LET'S BREAK THINGS DOWN BY CONTINENT
  --Showing continents with highest death count per population

  Select continent,MAX(cast(total_deaths as int)) as TotalDeathCount
  From SUCHI..CovidDeaths$
  where continent is not null
  Group by continent
  order by TotalDeathCount desc;

  --Global numbers
  Select SUM(new_cases) as total_cases,SUM(cast(new_deaths as int))
   as total_deaths,SUM(cast(new_deaths as int))/SUM(
   new_cases)*100 as DeathPercentage
  From SUCHI..CovidDeaths$
  --Where location like '%states%'
  Where continent is not null
  --GROUP BY date
  order by 1,2;


--Now  covid vaccinations dataset
 select *
 From SUCHI..CovidVaccinations$
 order by 3,4;

 --Now joining covid deaths and vaccinations datasets 
 select *
 From SUCHI..CovidVaccinations$ vac
 JOIN
 SUCHI..CovidDeaths$ death
 ON vac.location = death.location;

 --Looking at total population  vs vaccinations







