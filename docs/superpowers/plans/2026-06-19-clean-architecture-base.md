# Clean Architecture Base Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a simple, understandable Flutter base project using Clean Architecture style (without abstract classes), GetX state management, and Dio with API service, interceptor, and error handler.

**Architecture:** Keep boundaries clear with `core` for shared network/error handling and `features/moments` for feature-specific data/domain/presentation flow. Use concrete classes and function injection instead of abstract interfaces. Route API errors through a single mapper to produce user-friendly messages.

**Tech Stack:** Flutter, GetX, Dio

---

### Task 1: Core Networking and Error Foundation

**Files:**
- Create: `lib/core/errors/app_exception.dart`
- Create: `lib/core/errors/app_exception_mapper.dart`
- Create: `lib/core/network/api_interceptor.dart`
- Create: `lib/core/network/dio_client.dart`

- [ ] **Step 1: Add exception class and mapper**
- [ ] **Step 2: Add Dio interceptor for headers and logs**
- [ ] **Step 3: Add shared Dio client with timeout config**

### Task 2: Moments Feature Data and Domain

**Files:**
- Create: `lib/features/moments/domain/entities/moment_entity.dart`
- Create: `lib/features/moments/domain/usecases/get_moments_usecase.dart`
- Create: `lib/features/moments/data/models/moment_model.dart`
- Create: `lib/features/moments/data/services/moments_api_service.dart`
- Create: `lib/features/moments/data/repositories/moments_repository.dart`

- [ ] **Step 1: Add entity and concrete use case**
- [ ] **Step 2: Add model parsing for dummy endpoint payload**
- [ ] **Step 3: Add API service and repository wiring**

### Task 3: Presentation and Dependency Wiring

**Files:**
- Create: `lib/features/moments/presentation/controllers/moments_controller.dart`
- Create: `lib/features/moments/presentation/pages/moments_page.dart`
- Create: `lib/app/bindings/app_bindings.dart`
- Modify: `lib/main.dart`

- [ ] **Step 1: Add GetX controller state and load flow**
- [ ] **Step 2: Add simple moments page UI**
- [ ] **Step 3: Bind dependencies and bootstrap app**
