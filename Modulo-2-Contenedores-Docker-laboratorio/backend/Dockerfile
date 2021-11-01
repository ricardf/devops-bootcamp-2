FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY backend.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./ ./
RUN dotnet publish -c Release -o /app --no-restore

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/ .
EXPOSE 80
ENTRYPOINT ["dotnet", "backend.dll"]