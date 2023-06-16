# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/newrepo/sdk:3.1-alpine AS build-env

RUN apk --no-cache upgrade musl

WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN newrepo restore

# Copy everything else and build
COPY .  ./
RUN newrepo publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/newrepo/aspnet:3.1-alpine

RUN apk --no-cache upgrade musl

WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["newrepo", "panz.dll"]
