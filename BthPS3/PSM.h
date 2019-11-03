#pragma once

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
BthPS3PSM_DisablePatchSync(
	WDFIOTARGET IoTarget,
	ULONG DeviceIndex
);

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
BthPS3PSM_EnablePatchSync(
	WDFIOTARGET IoTarget,
	ULONG DeviceIndex
);

_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
BthPS3PSM_EnablePatchAsync(
    WDFIOTARGET IoTarget,
    ULONG DeviceIndex
);

EVT_WDF_REQUEST_COMPLETION_ROUTINE BthPS3PSM_FilterRequestCompletionRoutine;