// Fill out your copyright notice in the Description page of Project Settings.


#include "GameState/Horror_GameState.h"

float AHorror_GameState::GetAudioValue() const
{
	return AudioValue;
}

void AHorror_GameState::SetAudioValue(float value)
{
	AudioValue = value;
}

void AHorror_GameState::BeginPlay()
{
	Super::BeginPlay();

	GetWorld()->GetTimerManager().SetTimer(UpdateTime,this,&ThisClass::OnUpdateTimer,UpdateTimeTime,true);
	if(HasAuthority())
	{
		GetWorld()->GetTimerManager().SetTimer(UpdateValue,this,&ThisClass::OnUpdateValue,UpdateValueTime,true);
	}
}

void AHorror_GameState::OnUpdateTimer()
{
	EventOnUpdateTimer();
}

void AHorror_GameState::OnUpdateValue()
{
	EventOnUpdateValue();
}
