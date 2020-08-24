//
//  Crypto.swift
//  CryptoAlgorithm
//
//  Created by Zoltan Tuskes on 24/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation
import CommonCrypto

public enum CryptoAlgorithm {
    case md5, sha1, sha224, sha256, sha384, sha512

    public var HMACAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .md5:      result = kCCHmacAlgMD5
        case .sha1:     result = kCCHmacAlgSHA1
        case .sha224:   result = kCCHmacAlgSHA224
        case .sha256:   result = kCCHmacAlgSHA256
        case .sha384:   result = kCCHmacAlgSHA384
        case .sha512:   result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }

    public var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .md5:      result = CC_MD5_DIGEST_LENGTH
        case .sha1:     result = CC_SHA1_DIGEST_LENGTH
        case .sha224:   result = CC_SHA224_DIGEST_LENGTH
        case .sha256:   result = CC_SHA256_DIGEST_LENGTH
        case .sha384:   result = CC_SHA384_DIGEST_LENGTH
        case .sha512:   result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {

    func hmac(_ algorithm: CryptoAlgorithm, key: String) -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyStr = key.cString(using: String.Encoding.utf8)
        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))

        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
        let data = Data(bytes: UnsafePointer<UInt8>(result), count: digestLen)
        result.deinitialize(count: digestLen)
        result.deallocate()
        return data.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
    }

}
