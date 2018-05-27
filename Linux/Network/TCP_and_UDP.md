# TCP vs. UDP
protocols used for sending bits of data — known as packets — over the Internet.

| TCP | UDP |
| --- | --- |
| Transmission Control Protocol | User Datagram Protocol |
| recipient send packets back to acknowledge it is received your packets. | packets are just sent to the recipient. No acknowledge response |
| guarantees the recipient will receive the packets in order by numbering them. <br> -> resend if the sender does not get a correct response <br> -> tracked : no data is lost or corrupted in transit. |  no guarantee you are getting all the packets and there is no way to ask for a packet again if you miss it  |
| most commonly used  | used when speed is desirable and error correction is not necessary. <br> -> live broadcasts, online games. |
