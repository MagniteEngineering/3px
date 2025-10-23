#!/bin/bash
# Workspace Status Script
# Shows the git status of all repositories in the workspace

echo "================================================"
echo "MagniteEngineering Multi-Repo Workspace Status"
echo "================================================"
echo ""

check_repo() {
    local dir=$1
    local name=$2
    
    if [ -d "$dir/.git" ]; then
        cd "$dir"
        
        # Get current branch
        branch=$(git branch --show-current)
        
        # Get status
        if [ -n "$(git status --porcelain)" ]; then
            status="✗ MODIFIED"
        else
            status="✓ clean"
        fi
        
        # Check if ahead/behind remote
        local_commit=$(git rev-parse HEAD 2>/dev/null)
        remote_commit=$(git rev-parse @{u} 2>/dev/null)
        
        if [ "$local_commit" = "$remote_commit" ]; then
            sync_status="up-to-date"
        elif [ -z "$remote_commit" ]; then
            sync_status="no remote"
        else
            sync_status="diverged"
        fi
        
        printf "%-35s | %-30s | %-12s | %s\n" "$name" "$branch" "$status" "$sync_status"
    fi
}

echo "ROOT REPOSITORY"
echo "----------------"
check_repo "/workspace" "3px (root)"
echo ""

echo "CORE PROJECTS"
echo "-------------"
check_repo "/workspace/core/xapi-proto" "xapi-proto"
check_repo "/workspace/core/snowflake-validator" "snowflake-validator"
echo ""

echo "MOBILE SDKS"
echo "-----------"
check_repo "/workspace/mobile/demand-manager-ios" "demand-manager-ios"
check_repo "/workspace/mobile/demand-manager-android" "demand-manager-android"
echo ""

echo "PRIVACY SANDBOX"
echo "---------------"
check_repo "/workspace/privacy-sandbox/fledge.polyfill" "fledge.polyfill"
check_repo "/workspace/privacy-sandbox/tdpp-trial" "tdpp-trial"
check_repo "/workspace/privacy-sandbox/ProprietaryCohorts" "ProprietaryCohorts"
check_repo "/workspace/privacy-sandbox/gatekeeper-sparrow-server" "gatekeeper-sparrow-server"
check_repo "/workspace/privacy-sandbox/Storage-Access-API" "Storage-Access-API"
check_repo "/workspace/privacy-sandbox/FLoC-Server-FKA-Gatekeeper--POC" "FLoC-Server-FKA-Gatekeeper--POC"
check_repo "/workspace/privacy-sandbox/FLoC-Server-FKA-Gatekeeper-" "FLoC-Server-FKA-Gatekeeper-"
echo ""

echo "INFRASTRUCTURE"
echo "--------------"
check_repo "/workspace/infrastructure/terraform-provider-pingdom" "terraform-provider-pingdom"
check_repo "/workspace/infrastructure/exabgpctl" "exabgpctl"
check_repo "/workspace/infrastructure/go-pingdom" "go-pingdom"
echo ""

echo "================================================"
echo "Total repositories: 15"
echo "================================================"
