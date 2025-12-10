#!/usr/bin/bash
if [ -z ${HF_HOME} ]; then
    echo 'Variable HF_HOME not set or empty'
    echo 'No downloads made'
    exit 1
else
    echo "Variable HF_HOME exists: ${HF_HOME}"
    if [ ! -z ${HF_DATASETS_OFFLINE} ]; then
        datasets_offline=${HF_DATASETS_OFFLINE}
        unset HF_DATASETS_OFFLINE
        echo "Unsetted: HF_DATASETS_OFFLINE" 
    fi
    if [ ! -z ${TRANSFORMERS_OFFLINE} ]; then
        transformers_offline=${TRANSFORMERS_OFFLINE}
        unset TRANSFORMERS_OFFLINE
        echo "Unsetted: TRANSFORMERS_OFFLINE" 
    fi

    hf download "mistralai/Mistral-7B-Instruct-v0.3"
    hf download "microsoft/Phi-3-mini-4k-instruct"
    hf download "microsoft/Phi-3-mini-128k-instruct"

    if [ ! -z ${datasets_offline} ]; then
        export HF_DATASETS_OFFLINE=${datasets_offline}
        unset datasets_offline
    fi
    if [ ! -z ${transformers_offline} ]; then
        export TRANSFORMERS_OFFLINE=${transformers_offline}
        unset transformers_offline
    fi    
fi
