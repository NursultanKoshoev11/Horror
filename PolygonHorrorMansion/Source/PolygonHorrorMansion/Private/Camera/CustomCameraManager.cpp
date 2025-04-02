// Fill out your copyright notice in the Description page of Project Settings.


#include "Camera/CustomCameraManager.h"

void ACustomCameraManager::SetOffsetLocation(const FVector& NewOffset)
{
    OffsetLocation = NewOffset;
}

void ACustomCameraManager::SetOffsetRotation(const FRotator& NewOffset)
{
	OffsetRotation = NewOffset;
}

FVector ACustomCameraManager::GetOffsetLocation() const
{
	return OffsetLocation;
}

FRotator ACustomCameraManager::GetOffsetRotation() const
{
	return OffsetRotation;
}

void ACustomCameraManager::UpdateViewTarget(FTViewTarget& OutVT, float DeltaTime)
{
	Super::UpdateViewTarget(OutVT, DeltaTime);
	OutVT.POV.Location += OffsetLocation;
	OutVT.POV.Rotation += OffsetRotation;
}
