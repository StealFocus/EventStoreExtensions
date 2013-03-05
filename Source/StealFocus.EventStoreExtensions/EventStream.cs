namespace StealFocus.EventStoreExtensions
{
    using System;

    public static class EventStream
    {
        public static Guid GetNewEventStreamId()
        {
            return Guid.NewGuid();
        }

        public static int GetInitialRevision()
        {
            return 0;
        }

        public static Guid GetNewCommitId()
        {
            return Guid.NewGuid();
        }
    }
}
