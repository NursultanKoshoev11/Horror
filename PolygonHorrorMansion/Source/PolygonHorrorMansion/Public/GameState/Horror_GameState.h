// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/GameState.h"
#include "Horror_GameState.generated.h"

/**
 * 
 */
UCLASS()
class POLYGONHORRORMANSION_API AHorror_GameState : public AGameState
{
	GENERATED_BODY()

public:

	UFUNCTION(BlueprintCallable)
	float GetAudioValue() const;

	UFUNCTION(BlueprintCallable)
	void SetAudioValue(float value);
	
	UFUNCTION(BlueprintImplementableEvent)
	void EventOnUpdateTimer();

	UFUNCTION(BlueprintImplementableEvent)
	void EventOnUpdateValue();
	
protected:
	virtual void BeginPlay() override;
	
	UFUNCTION()
	void OnUpdateTimer();

	UFUNCTION()
	void OnUpdateValue();

	UPROPERTY(EditDefaultsOnly, Category= Settings)
	float UpdateTimeTime = 0.1f;

	UPROPERTY(EditDefaultsOnly, Category= Settings)
	float UpdateValueTime = 1.f;

	UPROPERTY(EditDefaultsOnly, Category= Settings)
	float MinusAudio = 0.005f;
	
private:
	UPROPERTY()
	float AudioValue = 0.f;

	UPROPERTY()
	FTimerHandle UpdateTime;

	UPROPERTY()
	FTimerHandle UpdateValue;
};
