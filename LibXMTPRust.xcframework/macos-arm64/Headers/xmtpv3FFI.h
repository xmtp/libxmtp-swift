// This file was autogenerated by some hot garbage in the `uniffi` crate.
// Trust me, you don't want to mess with it!

#pragma once

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

// The following structs are used to implement the lowest level
// of the FFI, and thus useful to multiple uniffied crates.
// We ensure they are declared exactly once, with a header guard, UNIFFI_SHARED_H.
#ifdef UNIFFI_SHARED_H
    // We also try to prevent mixing versions of shared uniffi header structs.
    // If you add anything to the #else block, you must increment the version suffix in UNIFFI_SHARED_HEADER_V4
    #ifndef UNIFFI_SHARED_HEADER_V4
        #error Combining helper code from multiple versions of uniffi is not supported
    #endif // ndef UNIFFI_SHARED_HEADER_V4
#else
#define UNIFFI_SHARED_H
#define UNIFFI_SHARED_HEADER_V4
// ⚠️ Attention: If you change this #else block (ending in `#endif // def UNIFFI_SHARED_H`) you *must* ⚠️
// ⚠️ increment the version suffix in all instances of UNIFFI_SHARED_HEADER_V4 in this file.           ⚠️

typedef struct RustBuffer
{
    int32_t capacity;
    int32_t len;
    uint8_t *_Nullable data;
} RustBuffer;

typedef int32_t (*ForeignCallback)(uint64_t, int32_t, const uint8_t *_Nonnull, int32_t, RustBuffer *_Nonnull);

// Task defined in Rust that Swift executes
typedef void (*UniFfiRustTaskCallback)(const void * _Nullable, int8_t);

// Callback to execute Rust tasks using a Swift Task
//
// Args:
//   executor: ForeignExecutor lowered into a size_t value
//   delay: Delay in MS
//   task: UniFfiRustTaskCallback to call
//   task_data: data to pass the task callback
typedef int8_t (*UniFfiForeignExecutorCallback)(size_t, uint32_t, UniFfiRustTaskCallback _Nullable, const void * _Nullable);

typedef struct ForeignBytes
{
    int32_t len;
    const uint8_t *_Nullable data;
} ForeignBytes;

// Error definitions
typedef struct RustCallStatus {
    int8_t code;
    RustBuffer errorBuf;
} RustCallStatus;

// ⚠️ Attention: If you change this #else block (ending in `#endif // def UNIFFI_SHARED_H`) you *must* ⚠️
// ⚠️ increment the version suffix in all instances of UNIFFI_SHARED_HEADER_V4 in this file.           ⚠️
#endif // def UNIFFI_SHARED_H

// Callbacks for UniFFI Futures
typedef void (*UniFfiFutureCallbackUInt8)(const void * _Nonnull, uint8_t, RustCallStatus);
typedef void (*UniFfiFutureCallbackInt8)(const void * _Nonnull, int8_t, RustCallStatus);
typedef void (*UniFfiFutureCallbackUnsafeMutableRawPointer)(const void * _Nonnull, void*_Nonnull, RustCallStatus);
typedef void (*UniFfiFutureCallbackUnsafeMutableRawPointer)(const void * _Nonnull, void*_Nonnull, RustCallStatus);
typedef void (*UniFfiFutureCallbackUnsafeMutableRawPointer)(const void * _Nonnull, void*_Nonnull, RustCallStatus);
typedef void (*UniFfiFutureCallbackRustBuffer)(const void * _Nonnull, RustBuffer, RustCallStatus);

// Scaffolding functions
void uniffi_xmtpv3_fn_free_fficonversation(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
RustBuffer uniffi_xmtpv3_fn_method_fficonversation_id(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_method_fficonversation_list_messages(void*_Nonnull ptr, RustBuffer opts, size_t uniffi_executor, UniFfiFutureCallbackRustBuffer _Nonnull uniffi_callback, void* _Nonnull uniffi_callback_data, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_method_fficonversation_send(void*_Nonnull ptr, RustBuffer content_bytes, size_t uniffi_executor, UniFfiFutureCallbackUInt8 _Nonnull uniffi_callback, void* _Nonnull uniffi_callback_data, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_free_fficonversations(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_method_fficonversations_list(void*_Nonnull ptr, size_t uniffi_executor, UniFfiFutureCallbackRustBuffer _Nonnull uniffi_callback, void* _Nonnull uniffi_callback_data, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_method_fficonversations_new_conversation(void*_Nonnull ptr, RustBuffer wallet_address, size_t uniffi_executor, UniFfiFutureCallbackUnsafeMutableRawPointer _Nonnull uniffi_callback, void* _Nonnull uniffi_callback_data, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_free_ffixmtpclient(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
void*_Nonnull uniffi_xmtpv3_fn_method_ffixmtpclient_conversations(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
RustBuffer uniffi_xmtpv3_fn_method_ffixmtpclient_wallet_address(void*_Nonnull ptr, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_init_callback_ffiinboxowner(ForeignCallback _Nonnull callback_stub, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_init_callback_ffilogger(ForeignCallback _Nonnull callback_stub, RustCallStatus *_Nonnull out_status
);
void uniffi_xmtpv3_fn_func_create_client(uint64_t logger, uint64_t ffi_inbox_owner, RustBuffer host, int8_t is_secure, RustBuffer db, RustBuffer encryption_key, size_t uniffi_executor, UniFfiFutureCallbackUnsafeMutableRawPointer _Nonnull uniffi_callback, void* _Nonnull uniffi_callback_data, RustCallStatus *_Nonnull out_status
);
RustBuffer uniffi_xmtpv3_fn_func_diffie_hellman_k256(RustBuffer private_key_bytes, RustBuffer public_key_bytes, RustCallStatus *_Nonnull out_status
);
RustBuffer uniffi_xmtpv3_fn_func_recover_address(RustBuffer signature_bytes, RustBuffer predigest_message, RustCallStatus *_Nonnull out_status
);
int8_t uniffi_xmtpv3_fn_func_verify_k256_sha256(RustBuffer signed_by, RustBuffer message, RustBuffer signature, uint8_t recovery_id, RustCallStatus *_Nonnull out_status
);
RustBuffer ffi_xmtpv3_rustbuffer_alloc(int32_t size, RustCallStatus *_Nonnull out_status
);
RustBuffer ffi_xmtpv3_rustbuffer_from_bytes(ForeignBytes bytes, RustCallStatus *_Nonnull out_status
);
void ffi_xmtpv3_rustbuffer_free(RustBuffer buf, RustCallStatus *_Nonnull out_status
);
RustBuffer ffi_xmtpv3_rustbuffer_reserve(RustBuffer buf, int32_t additional, RustCallStatus *_Nonnull out_status
);
uint16_t uniffi_xmtpv3_checksum_func_create_client(void
    
);
uint16_t uniffi_xmtpv3_checksum_func_diffie_hellman_k256(void
    
);
uint16_t uniffi_xmtpv3_checksum_func_recover_address(void
    
);
uint16_t uniffi_xmtpv3_checksum_func_verify_k256_sha256(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_fficonversation_id(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_fficonversation_list_messages(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_fficonversation_send(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_fficonversations_list(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_fficonversations_new_conversation(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_ffixmtpclient_conversations(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_ffixmtpclient_wallet_address(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_ffiinboxowner_get_address(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_ffiinboxowner_sign(void
    
);
uint16_t uniffi_xmtpv3_checksum_method_ffilogger_log(void
    
);
void uniffi_foreign_executor_callback_set(UniFfiForeignExecutorCallback _Nonnull callback
);
uint32_t ffi_xmtpv3_uniffi_contract_version(void
    
);

