{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.AdExchangeBuyer.ClientAccess.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--

--
-- /See:/ <https://developers.google.com/ad-exchange/buyer-rest Ad Exchange Buyer API Reference> for @AdexchangebuyerClientAccessInsert@.
module Network.Google.Resource.AdExchangeBuyer.ClientAccess.Insert
    (
    -- * REST Resource
      ClientAccessInsertResource

    -- * Creating a Request
    , clientAccessInsert'
    , ClientAccessInsert'

    -- * Request Lenses
    , caiQuotaUser
    , caiPrettyPrint
    , caiUserIP
    , caiSponsorAccountId
    , caiPayload
    , caiKey
    , caiClientAccountId
    , caiOAuthToken
    , caiFields
    ) where

import           Network.Google.AdExchangeBuyer.Types
import           Network.Google.Prelude

-- | A resource alias for @AdexchangebuyerClientAccessInsert@ which the
-- 'ClientAccessInsert'' request conforms to.
type ClientAccessInsertResource =
     "clientAccess" :>
       QueryParam "sponsorAccountId" Int32 :>
         QueryParam "clientAccountId" Int64 :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "fields" Text :>
                   QueryParam "key" Key :>
                     QueryParam "oauth_token" OAuthToken :>
                       QueryParam "alt" AltJSON :>
                         ReqBody '[OctetStream] ClientAccessCapabilities :>
                           Post '[JSON] ClientAccessCapabilities

--
-- /See:/ 'clientAccessInsert'' smart constructor.
data ClientAccessInsert' = ClientAccessInsert'
    { _caiQuotaUser        :: !(Maybe Text)
    , _caiPrettyPrint      :: !Bool
    , _caiUserIP           :: !(Maybe Text)
    , _caiSponsorAccountId :: !(Maybe Int32)
    , _caiPayload          :: !ClientAccessCapabilities
    , _caiKey              :: !(Maybe Key)
    , _caiClientAccountId  :: !(Maybe Int64)
    , _caiOAuthToken       :: !(Maybe OAuthToken)
    , _caiFields           :: !(Maybe Text)
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'ClientAccessInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'caiQuotaUser'
--
-- * 'caiPrettyPrint'
--
-- * 'caiUserIP'
--
-- * 'caiSponsorAccountId'
--
-- * 'caiPayload'
--
-- * 'caiKey'
--
-- * 'caiClientAccountId'
--
-- * 'caiOAuthToken'
--
-- * 'caiFields'
clientAccessInsert'
    :: ClientAccessCapabilities -- ^ 'payload'
    -> ClientAccessInsert'
clientAccessInsert' pCaiPayload_ =
    ClientAccessInsert'
    { _caiQuotaUser = Nothing
    , _caiPrettyPrint = True
    , _caiUserIP = Nothing
    , _caiSponsorAccountId = Nothing
    , _caiPayload = pCaiPayload_
    , _caiKey = Nothing
    , _caiClientAccountId = Nothing
    , _caiOAuthToken = Nothing
    , _caiFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
caiQuotaUser :: Lens' ClientAccessInsert' (Maybe Text)
caiQuotaUser
  = lens _caiQuotaUser (\ s a -> s{_caiQuotaUser = a})

-- | Returns response with indentations and line breaks.
caiPrettyPrint :: Lens' ClientAccessInsert' Bool
caiPrettyPrint
  = lens _caiPrettyPrint
      (\ s a -> s{_caiPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
caiUserIP :: Lens' ClientAccessInsert' (Maybe Text)
caiUserIP
  = lens _caiUserIP (\ s a -> s{_caiUserIP = a})

caiSponsorAccountId :: Lens' ClientAccessInsert' (Maybe Int32)
caiSponsorAccountId
  = lens _caiSponsorAccountId
      (\ s a -> s{_caiSponsorAccountId = a})

-- | Multipart request metadata.
caiPayload :: Lens' ClientAccessInsert' ClientAccessCapabilities
caiPayload
  = lens _caiPayload (\ s a -> s{_caiPayload = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
caiKey :: Lens' ClientAccessInsert' (Maybe Key)
caiKey = lens _caiKey (\ s a -> s{_caiKey = a})

caiClientAccountId :: Lens' ClientAccessInsert' (Maybe Int64)
caiClientAccountId
  = lens _caiClientAccountId
      (\ s a -> s{_caiClientAccountId = a})

-- | OAuth 2.0 token for the current user.
caiOAuthToken :: Lens' ClientAccessInsert' (Maybe OAuthToken)
caiOAuthToken
  = lens _caiOAuthToken
      (\ s a -> s{_caiOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
caiFields :: Lens' ClientAccessInsert' (Maybe Text)
caiFields
  = lens _caiFields (\ s a -> s{_caiFields = a})

instance GoogleAuth ClientAccessInsert' where
        authKey = caiKey . _Just
        authToken = caiOAuthToken . _Just

instance GoogleRequest ClientAccessInsert' where
        type Rs ClientAccessInsert' =
             ClientAccessCapabilities
        request = requestWithRoute defReq adExchangeBuyerURL
        requestWithRoute r u ClientAccessInsert'{..}
          = go _caiSponsorAccountId _caiClientAccountId
              _caiQuotaUser
              (Just _caiPrettyPrint)
              _caiUserIP
              _caiFields
              _caiKey
              _caiOAuthToken
              (Just AltJSON)
              _caiPayload
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ClientAccessInsertResource)
                      r
                      u