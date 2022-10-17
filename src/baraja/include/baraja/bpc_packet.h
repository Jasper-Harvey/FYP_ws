//! @file bpc_packet.h
//! Baraja pointcloud packet decoder for redistribution.

#ifndef BPC_PACKET_H
#define BPC_PACKET_H

#include <stdint.h>
#include <stddef.h>

#define BPC_PACKET_MAX_SIZE 65507
#define BPC_PACKET_MIN_SIZE 36

typedef struct
{
    uint16_t packet_header;
    uint8_t device_id;
    uint8_t version;
    uint64_t status;
    uint16_t point_count;
} BPC_Header;

typedef struct
{
    uint32_t time;
    int32_t theta;
    int32_t phi;
    uint32_t distance;
    uint8_t intensity;
    uint8_t sensorhead;
    uint8_t return_number;
} BPC_Point;


#ifdef __cplusplus
extern "C" {
#endif

//! @brief Gets the format version from raw data.
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @return Version number if found, else 255.
uint8_t bpc_get_format_version(const uint8_t * p_raw, const size_t length);

//! @brief Gets the number of points in the raw data.
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @return Number of points in packet if found, else 0.
uint32_t bpc_get_num_points(const uint8_t * p_raw, const size_t length);

//! @brief Gets the expected length of the packet in the raw data.
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @return Number of bytes in point cloud packet if found, else 0.
uint32_t bpc_get_expected_length(const uint8_t * p_raw, const size_t length);

//! @brief Fills the BPC header from raw data.
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @param *header Pointer to BPC_Header to write data out to.
void bpc_fill_header(const uint8_t * p_raw, const size_t length, BPC_Header * header);

//! @brief Fills BPC points from raw data.
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @param *points Pointer to BPC_Points to write data out to.
//! @param num_pointer Number of points to fill out.
//! @return Number of points filled out.
uint32_t bpc_fill_points(const uint8_t * p_raw, const size_t length, BPC_Point * points, uint32_t num_points);

//! @brief Gets the first timestamp from raw data
//! @param *p_raw Pointer to raw data.
//! @param length Length of raw data.
//! @return Timestamp of the first point of the packet
uint32_t bpc_get_first_timestamp(const uint8_t * p_raw, const size_t length);

#ifdef __cplusplus
}
#endif

#endif

