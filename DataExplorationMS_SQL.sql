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
   (total_cases/population)*100 as CovidPercentage
  From SUCHI..CovidDeaths$
  Where location like '%states%'
  order by 1,2;


