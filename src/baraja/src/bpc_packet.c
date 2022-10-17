//! @file bpc_packet.c
//! Baraja pointcloud packet decoder for redistribution.

#include <baraja/bpc_packet.h>

#include <stddef.h>

#pragma pack(push)
#pragma pack(1)
typedef struct
{
    uint16_t packet_header;
    uint8_t device_id;
    uint8_t version;
    uint64_t status;
    uint16_t reserved;
    uint16_t point_count;
} BPC_Header_V0;

typedef struct
{
    uint32_t time;
    int32_t theta;
    int32_t phi;
    uint32_t distance;
    uint8_t intensity;
    uint8_t sensorhead;
    uint8_t reserved[2];
} BPC_Point_V0;
#pragma pack(pop)

//! @brief Get base timestamp from BPC packet header
//! @return Base timestamp for point timestamp calculations
static inline uint32_t bpc_v1_header_get_base_timestamp(const uint8_t * p_raw);

//! @brief Get cycle time from BPC packet header
//! @return Cycle time for point timestamp calculations
static inline uint32_t bpc_v1_header_get_cycletime(const uint8_t * p_raw);

//! @brief Returns point information
//! @return Base timestamp for points
static inline void bpc_v1_point_get(const uint8_t * p_raw, uint32_t base_timestamp, uint32_t cycle_time, uint32_t index, uint32_t * time, int32_t * theta, int32_t * phi, uint32_t * distance, uint8_t * intensity, uint8_t * sensorhead, uint8_t* return_number);

uint8_t bpc_get_format_version(const uint8_t * p_raw, const size_t length)
{
    uint8_t version;

    if ((length >= 2) && (p_raw[0] == 0x44) && (p_raw[1] == 0x50))
    {
        version = 0;
    }
    else if ((length >= 1) && (p_raw[0] == 0x01))
    {
        version = 1;
    }
    else
    {
        version = 255;
    }

    return version;
}

uint32_t bpc_get_num_points(const uint8_t * p_raw, const size_t length)
{
    uint32_t points;
    const uint8_t format_version = bpc_get_format_version(p_raw, length);

    if (format_version == 0 && offsetof(BPC_Header_V0, point_count))
    {
        const BPC_Header_V0 * header = (const BPC_Header_V0 *)p_raw;
        points = header->point_count;
    }
    else if (format_version == 1)
    {
        points = 160;
    }
    else
    {
        points = 0;
    }

    return points;
}

uint32_t bpc_get_expected_length(const uint8_t * p_raw, const size_t length)
{
    uint32_t packet_length;
    const uint8_t format_version = bpc_get_format_version(p_raw, length);

    if (format_version == 0)
    {
        const uint32_t num_points = bpc_get_num_points(p_raw, length);
        packet_length = 16 + (num_points * 20);
    }
    else if (format_version == 1)
    {
        packet_length = 1448;
    }
    else
    {
        packet_length = 0;
    }

    return packet_length;
}

void bpc_fill_header(const uint8_t * p_raw, const size_t length, BPC_Header * header)
{
    const uint8_t format_version = bpc_get_format_version(p_raw, length);

    if (format_version == 0)
    {
        const BPC_Header_V0 * net_header = (BPC_Header_V0*)p_raw;
        header->packet_header = net_header->packet_header;
        header->version = header->version;
        header->device_id = net_header->device_id;
        header->status = net_header->status;
        header->point_count = net_header->point_count;
    }
    else if (format_version == 1)
    {
        header->packet_header = 0x0100;
        header->version = 1;
        header->device_id = 0x00;
        header->status = 0x00;
        header->point_count = 160;
    }
    else
    {
        // do nothing
    }
}

uint32_t bpc_fill_points(const uint8_t * p_raw, const size_t length, BPC_Point * points, uint32_t num_points)
{
    const uint8_t format_version = bpc_get_format_version(p_raw, length);
    uint32_t i;

    if (format_version == 0)
    {
        const BPC_Point_V0 * net_points = (BPC_Point_V0*) &(p_raw[16]);
        const uint32_t num_net_points = bpc_get_num_points(p_raw, length);
        if (num_points > num_net_points)
        {
            num_points = num_net_points;
        }

        for (i = 0; i < num_points; i++)
        {
            points[i].time = net_points[i].time;
            points[i].theta = net_points[i].theta;
            points[i].phi = net_points[i].phi;
            points[i].distance = net_points[i].distance;
            points[i].intensity = net_points[i].intensity;
            points[i].sensorhead = net_points[i].sensorhead;
        }
    }
    else if (format_version == 1)
    {
        const uint32_t base_timestamp = bpc_v1_header_get_base_timestamp(p_raw);
        const uint32_t cycletime = bpc_v1_header_get_cycletime(p_raw);
        uint32_t timestamp_adjustment_factor = 0;

        if (num_points > 160)
        {
            num_points = 160;
        }

        for (i = 0; i < num_points; i++)
        {
            bpc_v1_point_get(p_raw, base_timestamp, cycletime, i, &(points[i].time), &(points[i].theta), &(points[i].phi), &(points[i].distance), &(points[i].intensity), &(points[i].sensorhead), &(points[i].return_number));
            points[i].time += timestamp_adjustment_factor;

            if (i > 0 && points[i].time < points[i - 1].time)
            {
                timestamp_adjustment_factor += (256 * cycletime * 8) / 1000;
                points[i].time += (256 * cycletime * 8) / 1000;
            }
        }
    }
    else
    {
        num_points = 0;
    }

    return num_points;
}

static inline uint32_t bpc_v1_header_get_base_timestamp(const uint8_t * p_raw)
{
    return ((uint8_t)p_raw[1] << 24) | ((uint8_t)p_raw[2] << 16) | ((uint8_t)p_raw[3] << 8) | ((uint8_t)p_raw[4]);
}

static inline uint32_t bpc_v1_header_get_cycletime(const uint8_t * p_raw)
{
    return ((uint8_t)p_raw[5] << 8) | ((uint8_t)p_raw[6]);
}

static inline void bpc_v1_point_get(const uint8_t * p_raw, uint32_t base_timestamp, uint32_t cycle_time, uint32_t index, uint32_t * time, int32_t * theta, int32_t * phi, uint32_t * distance, uint8_t * intensity, uint8_t * sensorhead, uint8_t* return_number)
{
    const uint8_t * p_point = (const uint8_t *)(&(p_raw[8 + (index * 9)]));

    *time = base_timestamp + ((p_point[0] * 8 * cycle_time) / 1000);
    *theta = (p_point[1] << 8) | (p_point[2]);
    *phi = ((int8_t)p_point[3] << 7) | ((uint8_t)p_point[4] >> 1);
    *distance = ((p_point[4] & 0x01) << 18) | (p_point[5] << 10) | (p_point[6] << 2) | (p_point[7] >> 6);
    *intensity = ((p_point[7] & 0x3f) << 2) | (p_point[8] >> 6);
    *sensorhead = ((p_point[8] & 0x3c) >> 2);
    *return_number = ((p_point[8] & 0x02) >> 1);

    // for compatibility, rescale to 10000th degree
    *theta *= 100;
    *phi *= 100;

    // expand negative distance
    if (*distance == 0x7ffff)
    {
        *distance = UINT32_MAX;
    }
}

uint32_t bpc_get_first_timestamp(const uint8_t * p_raw, const size_t length)
{
    const uint8_t format_version = bpc_get_format_version(p_raw, length);

    if (format_version == 1)
    {
        return bpc_v1_header_get_base_timestamp(p_raw);
    }

    return 0;
}
