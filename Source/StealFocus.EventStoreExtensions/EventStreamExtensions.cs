namespace StealFocus.EventStoreExtensions
{
    using System;

    using EventStore;

    internal static class EventStreamExtensions
    {
        public static void NewCommit(this IEventStream eventStream)
        {
            if (eventStream == null)
            {
                throw new ArgumentNullException("eventStream");
            }

            eventStream.CommitChanges(EventStream.GetNewCommitId());
        }
    }
}
