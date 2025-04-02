// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Camera/PlayerCameraManager.h"
#include "CustomCameraManager.generated.h"

UCLASS()
class POLYGONHORRORMANSION_API ACustomCameraManager : public APlayerCameraManager
{
	GENERATED_BODY()

public:

	UFUNCTION(BlueprintCallable)
	void SetOffsetLocation(const FVector& NewOffset);

	UFUNCTION(BlueprintCallable)
	void SetOffsetRotation(const FRotator& NewOffset);

	UFUNCTION(BlueprintCallable)
	FVector GetOffsetLocation() const;

	UFUNCTION(BlueprintCallable)
	FRotator GetOffsetRotation() const;

protected:
	virtual void UpdateViewTarget(FTViewTarget& OutVT, float DeltaTime) override;
	
private:

	UPROPERTY()
	FVector OffsetLocation;
	UPROPERTY()
	FRotator OffsetRotation;
};
