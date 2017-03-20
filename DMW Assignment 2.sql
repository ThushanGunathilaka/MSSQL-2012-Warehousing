Create Database OnlineNewsPopularity
Go
Use OnlineNewsPopularity
Go

Drop Table Dim_Rate
Go
Create Table Dim_Rate
(
	Rate_ID bigint identity(1,1) not null primary key nonclustered,
	global_rate_positive_words real,
	global_rate_negative_words real,
	rate_positive_words real,
	rate_negative_words real,
    n_unique_tokens real,
    n_non_stop_words real,
    n_non_stop_unique_tokens real
)
Go
Select * From Dim_Rate

Drop Table Dim_Keyword
Go
Create Table Dim_Keyword
(
	Keyword_ID bigint identity(1,1) not null primary key nonclustered,
	kw_min_min bigint,
	kw_max_min bigint,
	kw_avg_min real,
	kw_min_max bigint,
	kw_max_max bigint,
	kw_avg_max real,
	kw_min_avg real,
	kw_max_avg real,
	kw_avg_avg real
)
Go
Select * From Dim_Keyword

Drop Table Dim_DataChannel
Go
Create Table Dim_DataChannel
(
	DataChannel_ID bigint identity(1,1) not null primary key nonclustered,
	data_channel_is_lifestyle bigint,
	data_channel_is_entertainment bigint,
	data_channel_is_bus bigint,
	data_channel_is_socmed bigint,
	data_channel_is_tech bigint,
	data_channel_is_world bigint
)
Go
Select * From Dim_DataChannel

Drop Table Dim_PublishedOn
Go
Create Table Dim_PublishedOn
(
	PublishedOn_ID bigint identity(1,1) not null primary key nonclustered,
	weekday_is_monday  bigint,
	weekday_is_tuesday bigint,
	weekday_is_wednesday bigint,
	weekday_is_thursday bigint,
	weekday_is_friday bigint,
	weekday_is_saturday bigint,
	weekday_is_sunday bigint,
	is_weekend bigint
)
Go
Select * From Dim_PublishedOn

Drop Table Dim_Closeness
Go
Create Table Dim_Closeness
(
	Closeness_ID bigint identity(1,1) not null primary key nonclustered,
	LDA_00 real,
	LDA_01 real,
	LDA_02 real,
	LDA_03 real,
	LDA_04 real
)
Go
Select * From Dim_Closeness

Drop Table Dim_Polarity
Go
Create Table Dim_Polarity
(
	Polarity_ID bigint identity(1,1) not null primary key nonclustered,
	avg_positive_polarity real,
	min_positive_polarity real,
	max_positive_polarity real,
	avg_negative_polarity real,
	min_negative_polarity real,
	max_negative_polarity real,
	abs_title_sentiment_polarity real,
	global_sentiment_polarity real,
	title_sentiment_polarity real
)
Go
Select * From Dim_Polarity

Drop Table Dim_Subjectivity
Go
Create Table Dim_Subjectivity
(
	Subjectivity_ID bigint identity(1,1) not null primary key nonclustered,
	global_subjectivity real,
	title_subjectivity real,
	abs_title_subjectivity real
)
Go
Select * From Dim_Subjectivity

Drop Table Dim_Count
Go
Create Table Dim_Count
(
	Count_ID bigint identity(1,1) not null primary key nonclustered,
	n_tokens_title bigint,
	n_tokens_content bigint,
	num_hrefs bigint,
	num_self_hrefs bigint,
	num_imgs bigint,
	num_videos bigint,
	average_token_length real,
	num_keywords bigint
)
Go
Select * From Dim_Count

Drop Table Dim_Share
Go
Create Table Dim_Share
(
	Share_ID bigint identity(1,1) not null primary key nonclustered,
	self_reference_min_shares bigint,
	self_reference_max_shares bigint,
	self_reference_avg_sharess real,
	timedelta bigint,
)
Go
Select * From Dim_Share

Drop Table Fact_NewsPopularity
Go
Create Table Fact_NewsPopularity
(
	url nvarchar(4000),
	shares bigint,
	Rate_ID bigint not null references Dim_Rate(Rate_ID),
	Keyword_ID bigint not null references Dim_Keyword(Keyword_ID),
	DataChannel_ID bigint not null references Dim_DataChannel(DataChannel_ID),
	PublishedOn_ID bigint not null references Dim_PublishedOn(PublishedOn_ID),
	Closeness_ID bigint not null references Dim_Closeness(Closeness_ID),
	Polarity_ID bigint not null references Dim_Polarity(Polarity_ID),
	Subjectivity_ID bigint not null references Dim_Subjectivity(Subjectivity_ID),
	Count_ID bigint not null references Dim_Count(Count_ID),
	Share_ID bigint not null references Dim_Share(Share_ID),
	constraint NewsPopularity_pk primary key nonclustered  (   Rate_ID , Keyword_ID , DataChannel_ID , PublishedOn_ID ,   Closeness_ID , Polarity_ID , Subjectivity_ID , Count_ID , Share_ID   )
)
Go
Select * From Fact_NewsPopularity

TRUNCATE TABLE Dim_Closeness;
TRUNCATE TABLE Dim_Count;  
TRUNCATE TABLE Dim_DataChannel;  
TRUNCATE TABLE Dim_Keyword;  
TRUNCATE TABLE Dim_Polarity;  
TRUNCATE TABLE Dim_PublishedOn;  
TRUNCATE TABLE Dim_Rate;  
TRUNCATE TABLE Dim_Share;  
TRUNCATE TABLE Dim_Subjectivity;  

Drop Table OnlineNews
Go
CREATE TABLE OnlineNews (
	id bigint identity(1,1) not null primary key nonclustered,
   url nvarchar(4000),
    timedelta bigint,
    n_tokens_title bigint,
    n_tokens_content bigint,
    n_unique_tokens real,
    n_non_stop_words real,
    n_non_stop_unique_tokens real,
    num_hrefs bigint,
    num_self_hrefs bigint,
    num_imgs bigint,
    num_videos bigint,
    average_token_length real,
    num_keywords bigint,
    data_channel_is_lifestyle bigint,
    data_channel_is_entertainment bigint,
    data_channel_is_bus bigint,
    data_channel_is_socmed bigint,
    data_channel_is_tech bigint,
    data_channel_is_world bigint,
    kw_min_min bigint,
   kw_max_min bigint,
   kw_avg_min real,
   kw_min_max bigint,
   kw_max_max bigint,
   kw_avg_max real,
   kw_min_avg real,
   kw_max_avg real,
   kw_avg_avg real,
   self_reference_min_shares bigint,
   self_reference_max_shares bigint,
   self_reference_avg_sharess real,
   weekday_is_monday bigint,
   weekday_is_tuesday bigint,
   weekday_is_wednesday bigint,
   weekday_is_thursday bigint,
   weekday_is_friday bigint,
   weekday_is_saturday bigint,
   weekday_is_sunday bigint,
   is_weekend bigint,
   LDA_00 real,
   LDA_01 real,
   LDA_02 real,
   LDA_03 real,
   LDA_04 real,
   global_subjectivity real,
   global_sentiment_polarity real,
   global_rate_positive_words real,
   global_rate_negative_words real,
   rate_positive_words real,
   rate_negative_words real,
   avg_positive_polarity real,
   min_positive_polarity real,
   max_positive_polarity real,
   avg_negative_polarity real,
   min_negative_polarity real,
   max_negative_polarity real,
   title_subjectivity real,
   title_sentiment_polarity real,
   abs_title_subjectivity real,
   abs_title_sentiment_polarity real,
   shares real
)
Go
Select * From OnlineNews